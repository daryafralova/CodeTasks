#Приведённые ниже примеры показывают, как написать функцию accum:
#Примеры:
#accum("abcd") -> "A-Bb-Ccc-Dddd"
#accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
#accum("cwAt") -> "C-Ww-Aaa-Tttt"
#Параметр accum — это строка, которая содержит только буквы из a..z и A..Z.


def accum(st):
    spisok = []
    for i in range(len(st)):
        s = st[i]
        part = s.upper() + s.lower() * i
        spisok.append(part)
    return "-".join(spisok)