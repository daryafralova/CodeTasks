# На вход подается строка str. Напишите функцию even_pos, которая будет возвращать символы на четных позициях
class Answer:
    def even_pos(self, s):
        l = list(s)
        result = []
        for i in range(len(l)):
            if i % 2 == 0:
                result.append(str(l[i]))
        return ''.join(result)