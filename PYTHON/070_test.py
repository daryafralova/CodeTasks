#Given a number n, write a formula that returns n!.
#In case you forgot the factorial formula, n! = n * (n-1) * (n-2) ... 
#For example, 5!=5∗4∗3∗2∗1=120 so we'd return 120.
#Assume is n is a non-negative integer.

def factorial(n):
  res = 1
  for i in range(1, n+1):
    res = res * i
  return res