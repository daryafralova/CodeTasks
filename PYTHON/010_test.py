#В этом задании вам нужно создать функцию, которая принимает список неотрицательных целых чисел и строк и возвращает новый список с отфильтрованными строками.
def filter_list(l):
    result = []
    for item in l:
        if isinstance(item, int):
            result.append(item)
    return result