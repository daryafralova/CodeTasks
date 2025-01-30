#Возвращает количество гласных в заданной строке.
#В этой ката мы будем считать гласные a, e, i, o, u (но не y).
#Входная строка будет состоять только из строчных букв и / или пробелов.

def get_count(sentence):
    vowels = 'aeiou'
    count = 0
    for i in sentence:
        if i in vowels:
            count = count + 1
    return count