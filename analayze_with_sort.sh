#!/bin/bash

menu () {
    echo a. Input a Series. 
    echo b. Display the series in the order it was entered.
    echo c. Display the series in sorted order 
    echo d. Display the Max value of the series.
    echo e. Display the Min value of the series.
    echo f. Display the Average of the series.
    echo g. Display the Number of elements in the series.
    echo h. Display the Sum of the series.
    echo i. Exit.
    echo "choose from (a/b/c/d/e/f/g/h/i)"
}

input_nums(){
    read -p "enter a series of numbers " nums

    numbers=($nums)

    if $(validate_numbers ${numbers[@]}) ; then 
        return 0 
    else input_nums
    fi
}

validate_numbers() {
    local array=("$@")
    
    for value in "${array[@]}"; do
        if ! [[ "$value" =~ ^[0-9]+$ ]]; then
            return 1
        fi
    done
    
    return 0
}

main (){
    if [[ $# -ge 3 ]] && validate_numbers "$@"  ; then 
        numbers=("$@") 
    else 
        echo "wrong input"
        input_nums 
    fi 
    
    while true ; do
        menu
        read choice
        case $choice in 
            a) input_nums ;; 
            b) echo ${numbers[*]} ;;
            c) echo ${numbers[*]} | tr ' ' '\n' | sort -n ;;
            d) echo ${numbers[*]} | tr ' ' '\n' | sort -n | tail -n 1 ;;
            e) echo ${numbers[*]} | tr ' ' '\n' | sort -n | head -n 1 ;;
            f) echo ${numbers[*]} | tr ' ' '\n' | awk '{sum+=$1} END {print sum/NR}' ;;
            g) echo ${#numbers[@]} ;;
            h) echo ${numbers[*]} | tr ' ' '\n' | awk '{sum+=$1} END {print sum}' ;;
            i) break ;;
        esac
        echo "______________________________________"
    done 
}

main $@
