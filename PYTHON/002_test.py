#Вы получаете массив чисел и возвращаете сумму всех положительных чисел.Если суммировать нечего, сумма по умолчанию равна 0.

def positive_sum(arr):
    list_1=[]
    for i in arr:
        if i > 0:
            list_1.append(i)  
    return sum(list_1)
