# -*- coding: utf-8 -*-
"""
Created on Mon Sep 14 18:38:49 2020

@author: Vaibhav
"""

# Write a python program that finds the second largest number from a given list of numbers.

List = [int(a) for a in input().split()]

List.sort()

print("Second Largest number is :" , List[-2] )










# Given a positive integer N, write a program in python that checks if the number is prime or not.

if num>1:
    #check factors of num
    for i in range(2,num):
        if num%i==0:
            print("Entered number is not a prime")
            print(i , "Times" , int(num/i) , "is" , num)
            break
 #observe that the "else" below is not indented with the "if" above, thats because we do not want to run the else part every time the num%i==0 is iterated       
    else:
        print("Entered number is a prime")
else:
    print("Entered number must be greater than 1")