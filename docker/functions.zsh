da(){
  docker exec -it $1 bash
}
de(){
    docker exec $1 $2
}
dproxyon(){
    local proxy=$(cat $DOTFILES/local/docker_proxy.ini | cut -d "=" -f2)
    if [ -f ~/.docker/config.json ]; then
    python -c "import json;f=open('$HOME/.docker/config.json', 'r');c=json.loads(f.read());f.close();f=open('$HOME/.docker/config.json', 'w');c['proxies']={};c['proxies']['default']={};c['proxies']['default']['httpProxy']='${proxy}';c['proxies']['default']['httpsProxy']='${proxy}';f.write(json.dumps(c));f.close()"
    fi
}
dproxyoff(){
  if [ -f ~/.docker/config.json ]; then
      python -c "import json;f=open('$HOME/.docker/config.json', 'r');c=json.loads(f.read());f.close();f=open('$HOME/.docker/config.json', 'w');c.pop('proxies',None);f.write(json.dumps(c));f.close()"
  fi
}
function dsm(){ docker stop $1 && docker rm $1 || echo "failed!!!";}
function mc(){ ssh root@$1 }
function md_con() { docker run -it --rm -v `pwd`:/data -w /data $1 }
function md_ubuntu() { docker run -it --rm -v `pwd`:/data -w /data ubuntu:$1 }
function md_stego() { docker run -it --rm -p 127.0.0.1:6901:6901 -v `pwd`:/data dominicbreuker/stego-toolkit bash }
function md_pwn(){ 
    docker run -it --rm -v `pwd`:/ctf/work -p23946:23946 --cap-add=SYS_PTRACE lxzmads/pwndbgenv:14.04
}
function md_php(){
    if (( $# != 2 )); then
        echo "Usage:  me php <port> <version>";
    else
        docker run -d --name php-$2 -v `pwd`:/var/www/html -p $1:80 php:$2-apache;
        if (( $? == 0 ));then
            open -a "Google Chrome" "http://localhost:$1";
        fi
    fi
}

function md:usage(){
    echo "Usage:  me COMMAND
            
    Make a BRAND NEW CLEAN SELF DESTRUCTION environment or mads' env, whatever :)

    COMMANDS:
    php     make php environment.
    pwn     make pwn environment.
    stego   make stego environment.
    kali    make kali environment.
    ubuntu  make ubuntu environment.
    con     make a container with volumns.
    ";
}

function md(){ 
    if (( $# < 1 )); then
        md:usage;
    else
        case $1 in 
            php)
                md_php $2 $3;;     
            kali)
                md_kali;;
            pwn)
                md_pwn;;
            stego)
                md_stego;;
            ubuntu)
                md_ubuntu $2;;
            con)
                md_con $2;;
            *)
                md:usage;;
        esac
    fi
}
