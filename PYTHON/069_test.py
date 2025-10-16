#Write a function to get the intersection of two lists.
#For example, if A = [1, 2, 3, 4, 5], and B = [0, 1, 3, 7] then you should return [1, 3].

###1###  
def intersection(a, b):
  d = []
  for i in range(len(a)):
    if a[i] in b:
      d.append(a[i])
  return d
a = [0,1,3,5]
b = [2,3,4,5]
res = intersection(a,b)
print(res)

###2###  
def intersection(a,b):
  return list(set(a).intersection(set(b)))