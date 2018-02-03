#/bin/bash
OTPSECRET=KRCVGVCTKRJESTSHL5HVIUA=;

GREATER=30;
MAX=120;

# Set interval (duration) in seconds.
endTime=$(( $(date +%s) + $MAX )) # Calculate end time.

function clearLastLine() {
        tput cuu 1 && tput el
}

while [ $(date +%s) -lt $endTime ]; do  # Loop until interval has elapsed.

# oathool command options can be adjusted here
PIN="$(oathtool --totp --base32 $OTPSECRET;)"

    if [ $(date +%S) -gt "$GREATER" ]
    then
        clearLastLine
        echo "PIN=$PIN ... Update in `expr 60 - $(date +%S)  ` (STRG+C for EXIT)";
        
    else
        clearLastLine
        echo "PIN=$PIN ... Update in `expr  30 - $(date +%S) ` (STRG+C for EXIT)";
        
    fi
    sleep 1;
done

