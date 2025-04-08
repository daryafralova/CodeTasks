#Дан список:
#Найдите сумму элементов этого списка.
list_1 =[
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9],
]

total = 0
for i in list_1:
  total = total + sum(i)
print(total)