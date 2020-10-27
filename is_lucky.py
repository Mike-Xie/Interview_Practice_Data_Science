# first pass using for loop
def isLucky(n):
    str_n = str(n)
    first_half = str_n[len(str_n)//2:]
    second_half = str_n[:len(str_n)//2]
    
    sum_1, sum_2 = 0, 0
    for i in first_half:
        sum_1 += int(i)
        
    for i in second_half:
        sum_2 += int(i)
    
    if (sum_1 == sum_2):
        return True
    return False 

# better solution using map and shorter variable names 
def isLuckyMap(n):
    s = str(n)
    pivot_point = len(s)//2
    left, right = s[:pivot_point], s[pivot_point:]

    return sum(map(int, left)) == sum(map(int, right))