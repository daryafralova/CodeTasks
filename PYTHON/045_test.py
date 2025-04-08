#Дан список удалите из него каждый пятый элемент
spisok = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
new_list = []
for i in range(len(spisok)):
  if i+1 % 5 != 0:
    new_list.append(spisok[i])

print(new_list)