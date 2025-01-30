#В этом небольшом задании вам дана строка чисел, разделённых пробелами, и нужно вернуть самое большое и самое маленькое числа.
def high_and_low(numbers):
    num_list = list(map(int, numbers.split()))

    max_num = max(num_list)
    min_num = min(num_list)
    
    return f"{max_num} {min_num}"