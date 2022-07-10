import re
def question2(bin_text):

    pattern = re.compile(r'(0|1)*1(0|1){6}|11(0|1){4}|1011(0|1){2}|10111(0|1){1}|10101(0|1){1}')
    matches = pattern.findall(bin_text)
    if matches :
        print('accepted')
    else :
        print('rejected')

bin_text = '11010101'

question2(bin_text)