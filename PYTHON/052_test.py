## 4.5 Дана строка.Разбейте эту строку в список так, чтобы каждая непустая линия текста стала отдельным элементом списка

stroka = '''
	text1
	text2
	text3
	text4
	text5
'''
res = [
	'text1',
	'text2',
	'text3',
	'text4',
	'text5',
]


res = [] 
lines = stroka.splitlines() 

for line in lines:
    line = line.strip()
    if line:
        res.append(line)

print(res)
