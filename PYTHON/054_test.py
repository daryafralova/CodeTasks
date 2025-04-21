## 4.7 Дан список с числами. Проверьте, что в нем есть число, содержащее в себе цифру 3
spisok = [1, 43, 12]
for i in spisok:
  if '3' in str(i):
    print(f'Есть число с 3: {i}')
    break
else:
 print('Nope')