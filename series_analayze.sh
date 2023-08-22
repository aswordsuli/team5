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

reverse_order(){
    local reversed=()
    
    for ((i=${#numbers[@]}-1; i>=0; i--)); do
        reversed+=("${numbers[i]}")
    done
    
    echo "${reversed[@]}"
}

max_number(){
    local out=${numbers[0]}

    for ((i=1 ; i<${#numbers[@]} ; i++)); do
        if [[ $out -lt ${numbers[i]} ]]; then
            out=${numbers[i]}
        fi
    done
    echo $out
}

min_number(){
    local out=${numbers[0]}

    for ((i=1 ; i<${#numbers[@]} ; i++)); do
        if [[ $out -gt ${numbers[i]} ]]; then
            out=${numbers[i]}
        fi
    done
    echo $out
}

average_num(){

    for ((i=0;i<${#numbers[@]} ; i++)); do
    sum=$((sum + numbers[i]))
    done 
    avr=$((sum / ${#numbers[@]} ))
    echo $avr
}

sum(){

    for ((i=0;i<${#numbers[@]} ; i++)); do
    sum=$((sum + numbers[i]))
    done 
    echo $sum
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

input_nums(){
    read -p "enter a series of numbers " nums

    numbers=($nums)

    if [[ $(validate_numbers ${numbers[@]}) ]] ; then 
        continue 
    else input_nums
    fi
    
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
            c) echo $(reverse_order ${numbers[*]}) ;;
            d) echo $(max_number ${numbers[*]}) ;;
            e) echo $(min_number ${numbers[*]}) ;;
            f) echo $(average_num ${numbers[*]}) ;;
            g) echo ${#numbers[@]} ;;
            h) echo $(sum ${numbers[*]}) ;;
            i) break ;;
        esac
    echo "______________________________________"
    done 
}

main $@


#########################################################################################3
