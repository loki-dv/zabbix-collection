#!/bin/bash

FIRST_ELEMENT=1                                                                                                                                                                     
function json_head {                                                                                                                                                                
    printf "{";                                                                                                                                                                     
    printf "\"data\":[";                                                                                                                                                            
}                                                                                                                                                                                   
                                                                                                                                                                                    
function json_end {                                                                                                                                                                 
    printf "]";                                                                                                                                                                     
    printf "}";                                                                                                                                                                     
}

function check_first_element {
    if [[ $FIRST_ELEMENT -ne 1 ]]; then
        printf ","
    fi
    FIRST_ELEMENT=0
}

function databse_detect {
    json_head
    for PORT in `ps aux | grep redis | grep -v grep | awk '{print $12}' | awk -F: '{ print $2}' | grep -v redis`
    do
        check_first_element
        printf "{"
        printf "\"{#PORT}\":\"$PORT\""
        printf "}"
    done
    json_end
}

databse_detect


