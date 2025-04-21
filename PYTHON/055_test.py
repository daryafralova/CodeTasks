## 4.6 Дан список с числами. Оставьте в нем только те числа, которые содержат цифру ноль.
total = []
numbers = [1, 30, 22, 10, 103]
for i in numbers:
  if '0' in str(i):
    total.append(i)
print(total)