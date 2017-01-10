def check(a , b , size):

    count = 1
    
    if len(a) != len(b):
        print("IMPOSSIBLE")
        return False

    elif len(a) != size :
        print("IMPOSSIBLE")
        return False

    for i in range(0 , size ):
        if a[i] == '1' and b[i] == '1':
            count *= 2

        elif a[i] == '0' and b[i] == '0' :
            count *= 1
        elif a[i] == '0' and b[i] == '1' :
            count *= 1
        else :
            print("IMPOSSIBLE")
            return False

    print count
    return True
    
    
test_cases = int(raw_input())

for i in range(0 , test_cases):
    size = int(raw_input())
    if size > 100 or size <0 :
        print ("IMPOSSIBLE")
        break
    
    a = raw_input()
    b = raw_input()
    check(a , b , size)

