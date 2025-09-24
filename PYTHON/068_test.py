#In this kata you will be given a random string of letters and tasked with returning them as a string of comma-separated sequences sorted alphabetically, with each sequence starting with an uppercase character followed by n-1 lowercase characters, where n is the letter's alphabet position 1-26.

#"ZpglnRxqenU" -> "Eeeee,Ggggggg,Llllllllllll,Nnnnnnnnnnnnnn,Nnnnnnnnnnnnnn,Pppppppppppppppp,Qqqqqqqqqqqqqqqqq,Rrrrrrrrrrrrrrrrrr,Uuuuuuuuuuuuuuuuuuuuu,Xxxxxxxxxxxxxxxxxxxxxxxx,Zzzzzzzzzzzzzzzzzzzzzzzzzz"
#Technical Details
#The string will include only letters.
#The first letter of each sequence is uppercase followed by n-1 lowercase.
#Each sequence is separated with a comma.
#Return value needs to be a string.

def alpha_seq(strng):
    
    a = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
    d = {}
    strng = sorted(strng.lower())
    print(strng)
    for i in range(len(a)):
      d[a[i]] = i+1


    f = ''
    for n in range(len(strng)):
      if strng[n] in d:
        repeated_char = strng[n] * d[strng[n]]
        f = f + f'{repeated_char},'.capitalize()

    return(f[:-1])

