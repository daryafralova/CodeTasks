#На вход подается массив целых чисел arr. 
#Написать функцию even, которая возвращает список значений из исходного списка arr, 
#у которых четные индексы (индексацию считать с единицы).

class Answer():
  def even(self, arr):
    result = []
    for i in range(1, len(arr)):
      if i % 2 != 0:
        result.append(arr[i])
    return result