Complete the function that accepts a string parameter, and reverses each word in the string. All spaces in the string should be retained.
def reverse_words(text):
    words = text.split(' ')
    result = []
    for i in words:
        result.append(i[::-1])
    return ' '.join(result)