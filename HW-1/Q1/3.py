import re
def question3(bin_text):

    pattern = re.compile(r'(0|1(10)*(0|11)(01*01|01*00(10)*(0|11))*1)*')
    matches = pattern.findall(bin_text)

    if matches :
        print('accepted')
    else :
        print('rejected')


for i in range(20,50,5):# اعداد مضرب 5 در بازه 20 تا 50 را مورد برسی قرار میدهد. 
    bin_txt = bin(i)
    question3(bin_txt[2:])