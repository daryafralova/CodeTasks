## 4.8 Сформируйте с помощью циклов следующий список:
res = [
	['1', '2', '3'],
	['1', '2', '3'],
	['1', '2', '3']]

result = []

for _ in range(3):  # Повторяем 3 раза
    inner_list = []
    for i in range(1, 4):  # От 1 до 3 включительно
        inner_list.append(str(i))  # Преобразуем число в строку и добавляем
    result.append(inner_list)

print(result)