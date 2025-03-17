#Дано некоторое число. Проверьте, что цифры этого числа расположены по возрастанию.

#1)
num = 11
num_str = str(num)
print(type(num_str))
num_lst = list(num_str)
print(type(num_lst))
print(num_lst)
for i in range(len(num_lst)-1):
  if num_lst[i] > num_lst[i+1]:
     print('False')
     break
else:
    print('True')



#2)
num = 123456798
num_str = str(num)
print(type(num_str))
num_lst = list(num_str)
print(type(num_lst))
print(num_lst)
check = True
for i in range(len(num_lst)-1):
  if num_lst[i] > num_lst[i+1]:
     check = False
     break

print(check)



#3)
num = 123
my_list = []
my_list.extend(str(num))
my_list.sort()
int(''.join(my_list)) == num