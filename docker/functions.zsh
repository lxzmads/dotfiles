da(){
    docker exec -it $1 sh -c "which bash>/dev/null 2>&1&&bash||sh"
}
de(){
    docker exec $1 $2
}
function dsm(){ docker stop $1 && docker rm $1 || echo "failed!!!";}
function mc(){ ssh root@$1 }
function vm() { docker run -it --rm -v `pwd`:/data -w /data $1 }
function vm_ubuntu() { docker run -it --rm -v `pwd`:/data -w /data ubuntu:$1 }
function vm_neo() {
    docker ps -a -f 'name=ubuntu_neo' | grep ubuntu_neo >/dev/null
    if (( $? == 0 ));then
        docker start ubuntu_neo >/dev/null && docker exec -it ubuntu_neo /bin/zsh
    else
        docker run -it -v `pwd`:/data -w /data --name ubuntu_neo --entrypoint /bin/zsh ubuntu:neo
    fi
}
function vm_stego() { docker run -it --rm -p 127.0.0.1:6901:6901 -v `pwd`:/data dominicbreuker/stego-toolkit bash }
function vm_pwn(){
    docker run -it --rm -v `pwd`:/ctf/work -p23946:23946 --cap-add=SYS_PTRACE lxzmads/pwndbgenv:14.04
}
function vm_php(){
    if (( $# != 2 )); then
        echo "Usage:  vm php <port> <version>";
    else
        docker run -d --name php-$2 -v `pwd`:/var/www/html -p $1:80 php:$2-apache;
        if (( $? == 0 ));then
            open -a "Google Chrome" "http://localhost:$1" >/dev/null 2>&1;
        fi
    fi
}

function vm_php_nginx(){
    echo "UNIMPLEMENT"
}

function vm_tomcat(){
    if (( $# != 2 )); then
        echo "Usage:  vm tomcat <port> <version>";
    else
        docker run -dit --name tomcat-$2 -v `pwd`:/usr/local/tomcat/webapps -p $1:8080 tomcat:$2;
        if (( $? == 0 ));then
            open -a "Google Chrome" "http://localhost:$1" >/dev/null 2>&1;
        fi
    fi
}

function vm:usage(){
    echo "Usage:  vm COMMAND

    Make a BRAND NEW CLEAN SELF DESTRUCTION DOCKER environment (not f**k in CN), whatever :)

    COMMANDS:
    php     make php environment.
    tomcat  make tomcat environment.
    pwn     make pwn environment.
    stego   make stego environment.
    ubuntu  make ubuntu environment.
    con     make a container with volumns.
    ";
}

function vm(){
    if (( $# < 1 )); then
        vm:usage;
    else
        case $1 in
            php)
                vm_php $2 $3;;
            tomcat)
                vm_tomcat $2 $3;;
            pwn)
                vm_pwn;;
            stego)
                vm_stego;;
            ubuntu)
                vm_ubuntu $2;;
            neo)
                vm_neo $2;;
            con)
                vm_con $2;;
            *)
                vm:usage;;
        esac
    fi
}
