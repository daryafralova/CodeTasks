#Дано два множества: st1 и st2. 
#Написать функцию set_comp, которая будет возвращать True, если st1 и st2 не имеют общих элементов и False иначе.


class Answer:
    def set_comp(self, st1, st2):
        return False if len(st1.intersection(st2)) > 0 else True