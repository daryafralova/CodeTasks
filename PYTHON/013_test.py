#Дан массив из единиц и нулей. Преобразуйте эквивалентное двоичное значение в целое число.
#Например: [0, 0, 0, 1] обрабатывается как 0001 которое является двоичным представлением 1.

def binary_array_to_number(arr):
  return int(''.join(map(str, arr)), 2)