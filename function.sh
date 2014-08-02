#!/bin/bash
# File Name : function.sh
# Purpose :all function
# Creation Date : 03-08-2014
# Last Modified : Sun 03 Aug 2014 06:36:25 AM CST
# Release By : Doom.zhou

#Function 1
ip2dec () {
    local a b c d ip=$@
    IFS=. read -r a b c d <<< "$ip"
    printf '%d\n' "$((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))"
}
dec2ip () {
    local ip dec=$@
    for e in {3..0}
    do
        ((octet = dec / (256 ** e) ))
        ((dec -= octet * 256 ** e))
        ip+=$delim$octet
        delim=.
    done
    printf '%s\n' "$ip"
}

