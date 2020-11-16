def mutateTheArray(n, a):
    # add zero to front and back
    a[:0] = [0]
    a.append(0)
    print(a)
    # take 3 sub slices offset by 1 to left, nothing, 1 to right
    left = a[:-2]
    mid = a[1:-1]
    right = a[2:]
    # use zip and sum at same index 
    return [sum(i) for i in zip(left, mid, right)]


def countTinyPairs(a, b, k):
    # reverse b since we backwards one of them
    b.reverse()
    a = [str(i) for i in a]
    
    b = [str(i) for i in b]
    print(a,b)
    # list comp plus zip for pairwise concat
    c = [i+j for i, j in zip(a, b)]
    
    print(c)
    
    c = [int(i) for i in c]
    print(c)
    
    tiny = list(filter(lambda x : x < k, c))
    return (len(tiny))    

# fails 2 hidden tests, performs too slow 250/300
def concatenationsSum(a):
    
    a = [str(i) for i in a]
    print(a)
    cartesian_product = [j + k for j in a for k in a]
    print(cross_product)  
    # turn back into integers
    total = [int(i) for i in cross_product]
    
    return sum(total)