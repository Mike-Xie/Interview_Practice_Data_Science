from collections import Counter 



def commonCharacterCount(s1, s2):

    # iterate through each string and make count of individual characters 
    count_1 = Counter(s1)
    count_2 = Counter(s2)
    sum = 0 
    for i in count_1:
        if i in count_2:
            sum += min(count_1[i], count_2[i])    
            
            print(sum)
            
    return sum 

# version two using collections 
def commonCharacterCount(s1, s2):

    # iterate through each string and make count of individual characters 
    count_1 = Counter(s1)
    count_2 = Counter(s2)
    # sum = 0 
    # for i in count_1:
    #     if i in count_2:
    #         sum += min(count_1[i], count_2[i])    
            
    #         print(sum)
            
    # return sum 
    
    # can interact with counters using set operations 
    intersection = count_1 & count_2
    return sum(intersection.values())