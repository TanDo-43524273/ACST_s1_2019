#[randominteger.py]
import random as rd
print("[randominteger.py]")

bound_condition = False  # looping condition
while not bound_condition:
        a = round(float(input('Please enter the lower bound a = ')))
        b = round(float(input('Please enter the upper bound b = ')))
        if a < b:
                print("The rounded lower bound is a = %d" % (a))
                print("The rounded upper bound is b = %d" % (b))
                print("%d is generated as a random interger between %d and %d" % (rd.randint(a,b),a,b))
                bound_condition = True
        elif a==b:
                print("The two bounds are equal. Please re-enter their values.")
                bound_condition = False
        else:
                print("The input lower bound is greater than the upper bound. Please re-enter their values.")
                bound_condition = False
