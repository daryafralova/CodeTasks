## 4.8 Сформируйте с помощью циклов следующий список:
t = [
	[1, 2, 3],
	[1, 2, 3],
	[1, 2, 3],
	[1, 2, 3],
	[1, 2, 3],
]

result = []

for _ in range(5):
  inner_list = []
  for i in range(1,4):
    inner_list.append(str(i))
  result.append(inner_list)
print(result)