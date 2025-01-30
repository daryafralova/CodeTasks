#Ваша задача — создать функцию, которая может принимать в качестве аргумента любое неотрицательное целое число и возвращать его с цифрами в порядке убывания. 
#По сути, нужно переставить цифры так, чтобы получилось максимально возможное число.
def descending_order(num):
    num_str = str(num)
    digits = list(num_str)
    digits.sort(reverse=True)
    sorted_num_str = ''.join(digits)
    sorted_num = int(sorted_num_str)
    return sorted_num