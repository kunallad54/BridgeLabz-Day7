#! /bin/bash -x

#Problem 1: Write a program in the following steps
# 	 a. Generates 10 Random 3 Digit number.
#	 b. Store this random numbers into a array.
#	 c. Then find the 2nd largest and the 2nd smallest element without sorting the array.
secondMinMax(){
	max=0
	min=$((RANDOM))

	for(( i=0;i<=9;i++ ))
	do
		array[$i]=$((RANDOM%899 + 100))
		if [ $max -le ${array[$i]} ]
		then
			max=${array[$i]}
		fi
		if [ $min -gt ${array[$i]} ]
		then
			min=${array[$i]}
		fi
	done
	secondMax=0
	secondMin=$((RANDOM))
	for (( i=0;i<${#array[*]};i++ ))
	do
		if (( $secondMax<${array[$i]} && ${array[$i]}!=$max ))
		then
			secondMax=${array[$i]}
		fi
		if (( $secondMin>${array[$i]} && ${array[$i]}!=$min ))
		then
			secondMin=${array[$i]}
		fi
	done
	echo "${array[*]}"
	echo "Maximum = $max and Minimum = $min"
	echo "Second Maximum = $secondMax and Second Minimum = $secondMin"
}
secondMinMax

#Problem 2: Extend the above program to sort the array and then find the 2nd largest and the 2nd smallest element.

secondMinMaxUsingSort(){
	for(( i=0;i<=9;i++ ))
	do
        	array[$i]=$((RANDOM%899 + 100))
	done
	echo "Array is : ${array[*]}"
	for ((i=0; i<${#array[*]}; i++))
	do
        	for ((j=$i; j<${#array[*]}; j++))
        	do
        	if [ ${array[$i]} -gt ${array[$j]} ]
        	then
                	temp=${array[$i]}
                	array[$i]=${array[$j]}
                	array[$j]=$temp
        	fi
        	done
	done
	SECONDMINVALUE=${array[1]}
	SECONDMAXVALUE=${array[8]}
	echo "The sorted array : ${array[*]}"
	echo "The second largest element : $SECONDMAXVALUE"
	echo "The second smallest element : $SECONDMINVALUE"
}
secondMinMaxUsingSort

#Problem 3:Extend the Prime Factorization Program to store all the Prime Factors of a number n into an array
#          and finally display the output.

primeFactorUsingArray(){
	echo "Enter the number for prime factor:"
	read primeNumber
	for (( i=2;i<=$primeNumber;i++ ))
	do
        	modulo1=$(($primeNumber % $i))
        	if [ $modulo1 -eq 0 ]
        	then
                	isPrime=1
                	var=`echo "$i / 2" | bc`
                	#echo $var
                	for(( j=2;j<=$var;j++ ))
                	do
                        	modulo2=$(($i % $j))
                        	if [ $modulo2 -eq 0 ]
                        	then
                                	isPrime=0
                                	break
                        	fi
                	done
                	if [ $isPrime -eq 1 ]
                	then
                        	array=("$i" "${array[@]}")
                        	#adding elements inside the array
                	fi
        	fi
	done
	echo "The prime factors are as follows : ${array[*]}"
}
primeFactorUsingArray

#Problem 4: Write a Program to show Sum of three Integer adds to ZERO

sumOfThree(){
	#arr=(0, -1, 2, -3, 1);
	#n=5
	echo "Enter the length of the array:"
	read n
	i=0
	echo "Enter the number you want to store:"
	while [ $i -lt $n ]
	do
        	read arr[$i]
        	i=$((i+1))
	done
	echo "Elements of the array are : ${arr[*]}"
	found=0
	for(( i=0;i<$n-2;i++ ))
	do
        	for(( j=$i+1;j<$n-1;j++ ))
        	do
                	for(( k=$j+1;k<$n;k++ ))
                	do
                        	sum=$(( ${arr[$i]/,}+${arr[$j]/,}+${arr[$k]/,} ))
                        	if(( $sum == 0 ))
                        	then
                                	echo "Elements whose sum is zero are : ${arr[$i]} ${arr[$j]} ${arr[$k]} "
                                	found=1
                        	fi
                	done
        	done
	done
	if(( $found == 0 ))
	then
        	echo " not exist "
	fi
}
sumOfThree

#Problem 5: Take a range from 0 – 100, find the digits that are repeated twice like 33, 77, etc and store them in an array

repeatedNumbers(){
	for(( i=0;i<100;i++ ))
	do
        	a=$(($i % 10))
        	val=$((11 * $a))
        	if(( $i==0 ))
        	then
                	continue
        	elif(( $i==$val ))
        	then
                	arr=("$i" "${arr[@]}")
        	fi
	done
	echo "The numbers are : "
	echo ${arr[*]}
}
repeatedNumbers
