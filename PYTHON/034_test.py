#В этой задаче вам нужно заменить каждую букву в строке на её порядковый номер в алфавите.

#Если в тексте есть что-то, что не является буквой, проигнорируйте это и не возвращайтесь к этому.

#"a" = 1, "b" = 2 и т.д.

def alphabet_position(text):
    alphabet_dict = {
    'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8, 'i': 9, 'j': 10,  
    'k': 11, 'l': 12, 'm': 13, 'n': 14, 'o': 15, 'p': 16, 'q': 17, 'r': 18, 's': 19,  
    't': 20, 'u': 21, 'v': 22, 'w': 23, 'x': 24, 'y': 25, 'z': 26}
    text = text.lower()
    numbers = []
    letters = list(text)
    for i in letters:  #по каждому символу в списке
        if i in alphabet_dict: #есть ли буква в алфавите
            numbers.append(str(alphabet_dict[i]))
            
    return  " ".join(numbers)