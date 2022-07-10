import re
def question4(bin_text):

    pattern = re.compile(r'^(0|10)*(11(0|10)*110*){0,1}(0|10|01)*$|^((11(0|10)*110*)|111(0|10)*){0,1}(0|10|01)*$|^(0|10)*((11(0|10)*110*)|111(0|10)*){0,1}$')
    matches = pattern.findall(bin_text)
    #print(matches)
    if matches :
        print('accepted')
    else :
        print('rejected')

bin_txt = "0101110111"
question4(bin_txt)

bin_txt = "01011011"
question4(bin_txt)