

#реализовать функцию, которая принимает список целых чисел и сортирует его в волновом порядке на месте. 

def wave_sort(c):
    c.sort()
    for i in range(0, len(c)-1, 2):
        if i > 0 and c[i-1] > c[i]:
            c[i], c[i-1] = c[i-1], c[i]
        if i < len(c) -1 and c[i] < c[i+1]:
            c[i], c[i+1] = c[i+1], c[i]
    return c