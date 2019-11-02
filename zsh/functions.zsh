####################
# functions
####################

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}


# All the dig info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer
}

# Escape UTF-8 characters into their 3-byte format
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
    echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
function unidecode() {
    perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
    echo # newline
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
	local tmpFile="${@%/}.tar";
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

	size=$(
		stat -f"%z" "${tmpFile}" 2> /dev/null; # OS X `stat`
		stat -c"%s" "${tmpFile}" 2> /dev/null # GNU `stat`
	);

	local cmd="";
	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli";
	else
		if hash pigz 2> /dev/null; then
			cmd="pigz";
		else
			cmd="gzip";
		fi;
	fi;

	echo "Compressing .tar using \`${cmd}\`…";
	"${cmd}" -v "${tmpFile}" || return 1;
	[ -f "${tmpFile}" ] && rm "${tmpFile}";
	echo "${tmpFile}.gz created successfully.";
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Count git repo's summaries.
function git-count(){
    git clone -q --depth 1 "$1" temprepo &&
    printf "('tempgit' will be deleted automatically)\n\n\n" &&
    cloc temprepo &&
    rm -rf temprepo
}

# Set up terminal proxy
proxyon(){
    export $ALL_PROXY=$MPROXY
}

proxyoff(){
    unset ALL_PROXY
}
proxystatus(){
    if [[ -n $ALL_PROXY ]];then
        echo -e "Proxy: on"
    else
        echo "Proxy: off"
    fi
}
# Set up iterm2's tab color chain.
ssh_(){
    if (( $# > 2 )); then
        if [[ ! $@[$(( $# - 1 ))] =~ "-" ]]; then
            SECOND_P=$@[$(( $# - 2 ))]
            if [[ $SECOND_P =~ "-" ]]; then
                if [[ "46AaCfGgKkMNnqsTtVvXxYy" =~ ${SECOND_P:1} ]]; then
                    ssh $@
                else
                    ssh $@ "echo $IT2_SESSION_COLOR > /tmp/.madstmpcolor"
                    ssh $@
                fi
            else
                ssh $@
            fi
        else
            ssh $@ "echo $IT2_SESSION_COLOR > /tmp/.madstmpcolor"
            ssh $@
        fi
    else
        if (( $# == 1 )); then
            ssh $@ "echo $IT2_SESSION_COLOR > /tmp/.madstmpcolor"
            ssh $@
        else
            if [[ ! $@[$(( $# - 1 ))] =~ "-" ]]; then
                ssh $@
            else
                ssh $@ "echo $IT2_SESSION_COLOR > /tmp/.madstmpcolor"
                ssh $@
            fi
        fi
    fi
}
alias ssh=ssh_
