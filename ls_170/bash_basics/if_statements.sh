#!/bin/bash

number_1=12
number_2=100
string_1="testing 1-2-3"
string_2= ""

#Integers
echo Number 1: $number_1
echo -e "Number 2: $number_2\n"

if [[ $number_1 -lt 20 ]]
then echo $number_1 is less than 20
fi

if [[ $number_1 -gt 0 ]]
then echo $number_1 is greater than 0
fi

if [[ $number_2 -ge 100 ]]
then echo $number_2 is greater than or equal to 100
fi

if [[ $number_1 -le 12 ]]
then echo $number_1 is less than or equal to 12
fi

if [[ $number_2 -eq 100 ]]
then echo $number_2 is equal to 100
fi

if [[ $number_1 -ne $number_2 ]]
then echo $number_1 does NOT equal $number_2
fi

#Strings
if [[ -n $string_1 ]]
then echo the string has at least one character
fi

if [[ -z $string_2 ]]
then echo the string is empty
fi

if [[ $string_1 = $string_2 ]]
then echo the strings are equal
else echo the strings are not equal
fi

if [[ $string_1 != $string_1 ]]
then echo the strings are NOT equal
else echo the strings have the same characters
fi

#Files
if [[ -e ./test.sh ]]
then echo the asset was found
else echo we could not locate the file
fi

if [[ -d ./test_directory ]]
then echo the directory exists
else echo sorry we could not locate the asset
fi

if [[ -f ./test.sh ]]
then echo the file exists
else echo sorry we could not locate the asset
fi

if [[ -d ./top_secret_plans ]]
then echo we have found the top secret plans
else echo sorry, that directory does not exist
fi

if [[ -f ./top_secret_plans.sh ]]
then echo we have found the top secret plans
else echo sorry, we could no locate that file
fi

if [[ -e ./top_secret_plans ]]
then echo we have found the top secret plans
else echo sorry, we could not locate that file
fi

if [[ -e ./.top_secret_plans.sh ]]
then echo AH HA! We found them!
else echo nope, false alarm
fi