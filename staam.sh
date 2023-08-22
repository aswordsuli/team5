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


main(){

  if [[ $# -ge 3 ]] && validate_numbers "$@"  ; then 
    numbers=("$@") 
    else 
    echo "wrong input"
   #ask for input numbers
    fi 
 while true ; do
    menu 
    read choice
    case $choise in 

    esac

  done
}

main $@