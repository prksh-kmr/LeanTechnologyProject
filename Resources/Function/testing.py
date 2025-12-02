import calendar
import zipfile
import configparser
import copy
import glob
import json
import os
import random
import shutil
import string
import time
from zipfile import ZipFile
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.remote.webelement import WebElement
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By
from datetime import timedelta, datetime, date
import datetime
import csv
import string
import json
import random
import tempfile
import re
import uuid





# def random(word):
#     seen_e=False
#     result=""

#     for ch in word:
#         if ch == 'e':
#             if not seen_e:
#                 result += ch
#                 seen_e=True
#         else:
#             result += ch
#     return result

# def randomm(word):
#     seen_e=False
#     result=""

#     for ch in word:
#         if ch != 'e':
#             result += ch
#     return result


# word = randomm("encylopedia")
# print(word)


# Reverse a string and check if it’s a palindrome


# def check_palindrome(word):
#     reverse = ""

#     for ch in word:
#         reverse = ch + reverse
#     if word == reverse:
#         print(word, "string is palindrom")
#     else:
#         print(word, "string is not palindrom")
    


# word = "boy"
# check_palindrome(word)
# print(op)



# Find the second-highest number in an array.

# def find_highest(num):
#     num= list(set(num))
#     num.sort()
#     return num[-2]

# numbers = [5, 10, 0, 1]
# print("highest 2nd number is", find_highest(numbers))



# Write a function to remove duplicates from a list without using built-in sets

# def remove_duplicate(nums):
#     unique=[]
#     for num in nums:
#         if num not in unique:
#             unique.append(num)
#     print(unique)

# lst = [10, 10, 20, 50, 50]
# # print("unique numbers", remove_duplicate(lst))
# remove_duplicate(lst)





# sttringrandom = " prakash kumar "
# sttringrandomm = "PraKASH"

# def print_char(text):
#     tolowercase = text.lower()
#     print(tolowercase)
#     remove = tolowercase.replace(" ","")
#     count = {}
#     for ch in remove:
#         if ch in count:
#             count[ch] += 1
#         else:
#             count[ch] = 1

#     for ch, num, in count.items():
#         print(f"{ch} : {num}")



# print_char(sttringrandomm)


# cat,act
 
# listen  

# silent
 
# act,rat

# (isAnagram("listen", "silent")); // true
# (isAnagram("earth", "heart"));   // true
# (isAnagram("hello", "world"));   // false

# def is_anagram(word1, word2):

#     word1 = word1.replace(" ","").lower()
#     word2 = word2.replace(" ","").lower()

#     if len(word1) != len(word2):
#         return False

#     return sorted(word1) == sorted(word2)

# text1 = " "
# text2 = ""

# result = is_anagram(text1,text2)
# print(result)






# infosys
# i=1 n=1 f=1 0=1 s=2 y=1
 

# def char_count(text):
#     count = {}
#     for ch in text:
#         if ch in count:
#             count[ch] +=1
#         else:
#             count[ch]=1
#     for ch, num in count.items():
#         print(f"{ch} : {num}")

# char_count("infosys")


# text = input("enter string : ").lower()
# vowels = "aeiou"
# count = 0
# for ch in text:
#     if ch in vowels:
#         count += 1

# print("total vowel", count)
