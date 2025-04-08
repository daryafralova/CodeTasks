#Даны два числа. Получите список общих делителей этих чисел
num1 = 40
num2 = 30
divisors = []
for i in range(1, num1+1):
  if num1 % i == 0 and num2 % i == 0:
    divisors.append(i)
print(divisors)