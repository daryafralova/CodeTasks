## 4.8 Дана строка, удалите из нее все пустые строки, находящиеся не в начале и не в конце текста
stroka = '''
	text1
	text2
	
	text3
	text4
	
	text5
'''

res = '''
	text1
	text2
	text3
	text4
	text5
'''
s = ' '.join(stroka.split())
print(s)