da(){
  docker exec -it $1 bash
}
dproxyon(){
    local proxy=$(cat ./proxy.custom.sh | cut -d "=" -f2)
    if [ -f ~/.docker/config.json ]; then
    python -c "import json;f=open('./config.json', 'r');c=json.loads(f.read());f.close();f=open('./config.json', 'w');c['proxies']={};c['proxies']['default']={};c['proxies']['default']['httpProxy']='${proxy}';c['proxies']['default']['httpsProxy']='${proxy}';f.write(json.dumps(c));f.close()"
    fi
}
dproxyoff(){
  if [ -f ~/.docker/proxy.json ]; then
      python -c "import json;f=open('~/.docker/config.json', 'r');c=json.loads(f.read());f.close();f=open('~/.docker/config.json', 'w');c.pop('proxies',None);f.write(json.dumps(c));f.close()"
  fi
}
function dsm(){ docker stop $1 && docker rm $1 || echo "failed!!!";}
function mc(){ ssh root@$1 }
function me_con() { docker run -it --rm -v `pwd`:/home $1 }
function me_ubuntu() { docker run -it --rm -v `pwd`:/home ubuntu:14.04 }
function me_kali() { docker run -it --rm -v `pwd`:/home kali:top10}    
function me_stego() { docker run -it --rm -p 127.0.0.1:6901:6901 -v `pwd`:/data dominicbreuker/stego-toolkit bash }
function me_pwn(){ docker run -it --rm -v `pwd`:/ctf/work -p23946:23946 --cap-add=SYS_PTRACE skysider/pwndocker}
function me_php(){
    if (( $# != 2 )); then
        echo "Usage:  me php <port> <version>";
    else
        docker run -d --name php-$2 -v `pwd`:/var/www/html -p $1:80 php:$2-apache;
        if (( $? == 0 ));then
            open -a "Google Chrome" "http://localhost:$1";
        fi
    fi
}

function me:usage(){
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

function me(){ 
    if (( $# < 1 )); then
        me:usage;
    else
        case $1 in 
            php)
                me_php $2 $3;;     
            kali)
                me_kali;;
            pwn)
                me_pwn;;
            stego)
                me_stego;;
            ubuntu)
                me_ubuntu;;
            con)
                me_con $2;;
            *)
                me:usage;;
        esac
    fi
}