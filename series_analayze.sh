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
: '

-----------------------------NETWORKING-----------------------------------------------

--190.93.154.57/27-- 

Network:190.93.154.32
First Host:190.93.154.33
Last Host:190.93.154.62
Broadcast:190.93.154.63
Next Subnet:190.93.154.64
________________________

--29.31.33.69/8--

Network: 29.0.0.0
First Host:29.0.0.1 
Last Host:29.255.255.254    
Broadcast:29.255.255.255
Next Subnet:30.0.0.0
_________________________
--177.116.3.33/26--

Network:117.116.33.0
First Host:117.116.33.1
Last Host:117.116.33.62
Broadcast:117.116.33.63
Next Subnet:117.116.33.64

_________________________
--208.36.219.144/29--

Network:208.36.219.144
First Host:208.36.219.145
Last Host:208.36.219.150
Broadcast:208.36.219.151
Next Subnet:208.36.219.152

_________________________
--207.184.253.117/26--

Network:207.184.253.64
First Host:207.184.253.65
Last Host:207.184.253.126
Broadcast:207.184.253.127
Next Subnet:207.184.253.128

'
