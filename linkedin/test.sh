#!/bin/bash
exit_code=0
echo "Testing links..."

for link in $(grep http README.md  | cut -d\| -f 3); 
do 
    http_code=$(curl -s -o /dev/null -w "%{http_code}" $link);
    if [[ $http_code -ne 999 ]];
    then
        echo "Bad link: $link"
        let exit_code+=1
    fi
done

echo "Total bad links found: $exit_code"
exit $exit_code
