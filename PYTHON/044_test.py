#Дано число. Получите список делителей этого числа.
num = 50
divisors = []
for i in range(1, num+1):
  if num % i == 0:
    divisors.append(i)
print(divisors)