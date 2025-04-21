## 4.6 Дана  структура. Найдите сумму элементов этой структуры.

structura = [
	{
		1: 11,
		2: 12,
		3: 13,
	},
	{
		1: 21,
		2: 22,
		3: 23,
	},
	{
		1: 24,
		2: 25,
		3: 26,
	},
];

total = 0
for i in structura:
  total = total + sum(i.values())
print(total)