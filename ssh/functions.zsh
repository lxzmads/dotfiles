# cat 
pfc(){
cat ~/.ssh/config | sed -n -r -e "/^Host $1/,/^Host/p" | sed -r '$d;/^\s*$/d'
}
# modify
pfm(){
    # TODO
}
# port forwarding
pf(){

}