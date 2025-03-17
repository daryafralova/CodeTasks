#Дан список: [1, '', 2, 3, '', 5] Удалите из списка все пустые строки.

#1)
lst_1 = ['Hello', '', 'World', '', 'Python', '', '']
new_list = list(filter(None,lst_1))
print(new_list)


#2)
lst_1 = ['Hello', '', 'World', '', 'Python', '', '']
new_list = []
for i in lst_1:
    if i != '':
        new_list.append(i)
print(new_list)
