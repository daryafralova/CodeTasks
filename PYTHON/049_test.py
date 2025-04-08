#Дан список с числами. Оставьте в нем только те числа, которые делятся на 5
numbers = [25,1,4,0,6,35,45]
total = []
for i in numbers:
  if i % 5 == 0 and i !=0:
    total.append(i)
print(total)