#!/bin/bash

_connections="Connections.csv"
#_outputdir="/Users/youruser/Library/Mobile Documents/com~apple~CloudDocs/Obsidian/Main/"
_outputdir="outputs"

main(){
    sort -u "$_connections" > sortlist.txt
    # create data structure from each entry
    while read -r _a ; do
        #First Name,Last Name,Email Address,Company,Position,Connected On
        _regx="([^,]+),([^,]+),*,([^,]+),([^,]+),"
        [[ "${_a}" =~ $_regx ]]
        echo "${_a}"
        echo "${BASH_REMATCH[*]}"
        _firstname="${BASH_REMATCH[1]}"
        _lastname="${BASH_REMATCH[2]}"
        #_email="${BASH_REMATCH[3]}"
        _company="${BASH_REMATCH[3]}"
        _position="${BASH_REMATCH[4]}"
        # create filename
        _filename="${_firstname} ${_lastname}.md"
        # if the filename doesn't exist, create the file
        if [[ ! -f "${_outputdir}/${_filename}" ]] ; then
            touch "${_outputdir}/${_filename}"
        fi

        # if the file doesn't contain 'li_connections', append the LI info
        if ! grep -q 'li_connections' "${_outputdir}/${_filename}" ; then
            cat << EOF >>  "${_outputdir}/${_filename}"
  

# li_connections
Company: [[${_company}]]
Position: ${_position}
EOF
        fi
    done < sortlist.txt
}

main