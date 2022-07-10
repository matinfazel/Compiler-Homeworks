import re
def validate_bin_text(bin_text):

    pattern = re.compile(r'^(00*10*10*10*10*)0$|^(00*10*10*10*)1$|^(10*10*10*10*)0$|^(10*10*10*)1$')
    matches = pattern.findall(bin_text)
    if matches:
        print('excepted')
    else:
        print('not excepted')

    return

bin_txt_1 = '110000100000'
bin_txt_2 = '1110000000001'

validate_bin_text(bin_txt_1)
validate_bin_text(bin_txt_2)
