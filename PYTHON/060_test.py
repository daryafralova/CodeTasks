## 4.9 Сформируйте с помощью циклов список
res = [
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9],
]

result = []
count=1
for i in range(3):
  inner_list =[]
  for n in range(3):
    inner_list.append(count)
    count = count + 1
  result.append(inner_list)
print(result)