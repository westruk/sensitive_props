RESETPROP="${0%/*}/bin/arm64-v8a/resetprop"

chmod 755 $RESETPROP

check_resetprop(){
    local VALUE="$($RESETPROP -v "$1")"
    [ ! -z "$VALUE" ] && [ "$VALUE" != "$2" ] && $RESETPROP -v -n "$1" "$2"
}

maybe_resetprop(){
    local VALUE="$($RESETPROP -v "$1")"
    [ ! -z "$VALUE" ] && echo "$VALUE" | grep -q "$2" && $RESETPROP -v -n "$1" "$3"
}

replace_value_resetprop(){
    local VALUE="$($RESETPROP -v "$1")"
    [ -z "$VALUE" ] && return
    local VALUE_NEW="$(echo -n "$VALUE" | sed "s|${2}|${3}|g")"
    [ "$VALUE" == "$VALUE_NEW" ] || $RESETPROP -v -n "$1" "$VALUE_NEW"
}