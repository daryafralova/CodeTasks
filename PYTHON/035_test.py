#Напишите функцию persistence, которая принимает положительный параметр num и возвращает его мультипликативную устойчивость, то есть количество раз, которое нужно умножить цифры в num до тех пор, пока не получится одна цифра.

#Например (Ввод -> Вывод):
#39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit, there are 3 multiplications)
#999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2, there are 4 multiplications)
#4 --> 0 (because 4 is already a one-digit number, there is no multiplication)

def persistence(n):
    count = 0  # Счетчик 
    
    while n >= 10:  # Пока число не станет однозначным
        digits = [int(digit) for digit in str(n)]  # Преобразуем число в список цифр
        result = 1 
        
        for digit in digits:  
            result *= digit  
        
        n = result 
        count += 1  # Увеличиваем счетчик
    
    return count