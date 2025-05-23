#Джейден Смит, сын Уилла Смита, — звезда таких фильмов, как «Парень-каратист» (2010) и «После Земли» (2013).
#Джейден также известен некоторыми своими философскими высказываниями, которые он публикует в Твиттере. 
#Когда он пишет в Твиттере, он почти всегда пишет каждое слово с заглавной буквы. Для простоты вам придётся писать каждое слово с заглавной буквы. 
#Посмотрите, как пишутся сокращения в приведённом ниже примере.

#Ваша задача — преобразовать строки так, как их написал бы Джейден Смит. 
#Строки — это реальные цитаты Джейдена Смита, но они написаны не с заглавной буквы так, как он их изначально напечатал.



def to_jaden_case(string):
    words = string.split() #строку на список слов
    
    new_list = [] #новый список где каждое слово будет начинаться с заглавной буквы
    for i in words:
        words_capitalized = i.capitalize()
        new_list.append(words_capitalized)
        
    new_string = ' '.join(new_list)
    return new_string 