
#Даны два слова: word1 и word2. Написать функцию anagram для определения, являются ли эти слова анаграммами.

#Примечание: Анаграммами называются слова, которые состоят из одного и того же набора букв (и имеют одинаковую длину).


class Answer:
    def anagram(self, word1, word2):
        d1 = {}
        d2 = {}
        if len(word1) != len(word2):
            return False
        else:
            for i in word1:
                d1[i] = word1.count(i)
            for u in word2:
                d2[u] = word2.count(u)
        return True if d1 == d2 else False