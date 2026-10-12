#!/bin/bash

NUM1=100
NUM2=200

result=$((NUM1 + NUM2))
echo "The sum of $NUM1 and $NUM2 is: $result"


FRUITS=("Apple" "Banana" "Cherry")
echo "The first fruit is: ${FRUITS[#]}"

echo "The number of fruits is: ${#FRUITS[@]}"