#Это конец учебного года, судьбоносный момент вашего школьного отчёта. Нужно подсчитать средние баллы. 
#Все ученики приходят к вам и просят подсчитать их средние баллы. Легко! Вам просто нужно написать сценарий.
#Верните среднее значение заданного массива, округлённое вниз до ближайшего целого числа.
#Массив никогда не будет пустым.

def get_average(marks):
    total = sum(marks) // len(marks)
    return total