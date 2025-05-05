#Дан список, слейте элементы этого списка в один одномерный список odnomernij = [1, 2, 3, 4, 5, 6, 7, 8, 9]
spisok = [
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9],
]
spisok_2 = []
for i in spisok:
  spisok_2.extend(i)
print(spisok_2)