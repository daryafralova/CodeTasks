#We are diligently pursuing our elusive operative, Matthew Knight, who also goes by the alias Roy Miller. He employs a nomadic lifestyle to evade detection, constantly moving from one location to another, with each of his journeys following a perplexing and non-standard sequence of itineraries. Our mission is to decipher the routes he will undertake during each of his voyages.
#Task
#You've been provided with an array of itinerary routes, decipher the precise destinations he will visit in the correct sequence according to his meticulously planned itineraries.

#Example
#Based on the provided routes:
#[ [USA, BRA], [JPN, PHL], [BRA, UAE], [UAE, JPN] ]
#The correct sequence of destinations is:
#"USA, BRA, UAE, JPN, PHL"
#You can safely assume that there will be no duplicate locations with distinct routes.
#All routes provided will have non-empty itineraries.
#There will always be at least one (1) route connecting one waypoint to another.

# routes = [['USA', 'BRA'], ['JPN', 'PHL'], ['BRA', 'UAE'], ['UAE', 'JPN']]
# c = [['one', 'two']]
routes = [('San Policarpo','Oras'), ('Balangiga','Lawaan'), ('Borongan','Maydolong'), ('Jipapad','Maslog'), ('Balangkayan','Llorente'), ('Mercedes','Guiuan'), ('Taft','Sulat'), ('Sulat','San Julian'), ('Arteche','San Policarpo'), ('Oras','Dolores'), ('Dolores','Can-avid'), ('Can-avid','Taft'), ('San Julian','Borongan'), ('Maydolong','Balangkayan'), ('Llorente','Hernani'), ('Hernani','General MacArthur'), ('General MacArthur','Giporlos'), ('Giporlos','Balangiga'), ('Lawaan','Salcedo'), ('Salcedo','Mercedes'), ('Maslog','Arteche')]


#"USA, BRA, UAE, JPN, PHL"

check = {}
for i in routes:
  if i[0] in check.keys(): # dict.keys -возвращает все ключи из словаря
    check.pop(i[0]) # удалить этот ключ
  else:
    check[i[0]] = 's'
  if i[1] in check.keys():
    check.pop(i[1])
  else:
    check[i[1]] = 'f'
print(check)

for i in check.keys():
  if check[i] == 's':
    start = i

for i in routes:
  if i[0] == start:
    s =  f'{i[0]}, {i[1]}' # финальная строка
    v = i[1] # ищем это слово в начале списка
    routes.remove(i)

while len(routes) > 0 :
  test = len(routes)
  for i in routes:
    if i[0] == v:
      s = s + f', {i[1]}'
      v = i[1]
      routes.remove(i)
      break
  if test == len(routes):
    break
print(s)