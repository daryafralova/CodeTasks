#Дано 2 Pandas-датафрема. 
#Датафрейм sales:
#-ProductId
#-Amount
#-Sum

#Датафрейм Products:
#-ProductId
#-ProductName

#Реализуйте аналог Excel-функции VLOOKUP (или ВПР): необходимо написать функцию vlookup, которая принимает на вход 2 исходных датафрейма, а возвращает новый датафрейм вида:
#-ProductId
#-Amount
#-Sum
#-ProductName

#Естественно, поле ProductID является ключом в двух таблицах.
#Важно: Если в таблице sales есть запись с каким-то ProductID, но в таблице Products такого ProductID нет, то в итоговом датафрейме эта строка должна фигурировать, но в столбце ProductName должно быть NaN.

import pandas as pd

sales = [
    {'ProductID': 1, 'Amount': 5, 'Sum': 528},
    {'ProductID': 2, 'Amount': 2, 'Sum': 624}, 
    {'ProductID': 2, 'Amount': 1, 'Sum': 312}, 
    {'ProductID': 3, 'Amount': 1, 'Sum': 10}, 
    {'ProductID': 4, 'Amount': 8, 'Sum': 10842}, 
    {'ProductID': 4, 'Amount': 3, 'Sum': 4065}, 
    {'ProductID': 5, 'Amount': 1, 'Sum': 1024}
]


products = [
    {'ProductID': 1, 'ProductName': 'Apple'},
    {'ProductID': 2, 'ProductName': 'Mango'}, 
    {'ProductID': 3, 'ProductName': 'Banana'}, 
    {'ProductID': 4, 'ProductName': 'Orange'}
]

sales, products = pd.DataFrame(sales), pd.DataFrame(products)


class Answer:
    def vlookup(self, sales, products):
        df = pd.merge(sales, products, how='left', on='ProductID')
        return df
		
		
#Объединение двух таблиц по ключу - стандартная задача в дата-аналитике. И если в Excel такая задача решается с помощью функции VLOOKUP, то в Pandas это можно сделать с помощью функции merge.
#Примечание: Функция merge, как и VLOOKUP - аналоги различных JOIN в языке SQL.

#Аргументы функции merge:
#Левая таблица
#Правая таблица
#В аргумент on передаем название ключа, по которому идет объединение.

#Важно: Название столбца, которое передается в аргумент on должно быть одинаковым в обоих таблицах. Если это не так, то нужно воспользоваться left_on и right_on.
#Интересным моментом в данной задаче также является условие, что все строки «левой» таблицы sales должны присутствовать в итоговом датафрейме, вне зависимости от наличия соответствующего ProductID в таблице Products.
#Такой вид соединения называется левым и в Pandas достигается с помощью аргумента how='left'.