## 4.7 Дан список. Сделайте из этого списка строку так, чтобы каждый элемент списка был на новой линии
spisok = [
	'text1',
	'text2',
	'text3',
	'text4',
	'text5',
]

res = '''
	text1
	text2
	text3
	text4
	text5
'''

result = '\n\t' + '\n\t'.join(spisok)
result = f"'''\n{result}\n'''"

print(result)