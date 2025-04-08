#Дано число. Проверьте, что у этого числа есть только один делитель, кроме него самого и единицы.
number = 4
divisors = 0
for i in range(2,number):
  if number % i == 0:
    divisors = divisors + 1
if divisors == 1:
  print(f"У {number} только один делитель, кроме него самого и единицы.")
else:
  print(f"У {number} больше одного делителя, кроме него самого и единицы.")