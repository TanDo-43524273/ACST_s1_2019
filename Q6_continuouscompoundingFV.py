#[countinuouscompoundingFV.py]
print("[Continuous compounding Future Value]")
import math
import locale
locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')

year_condition = False  # looping condition
while not year_condition:
	t = float(input('Please enter the number of years, t = '))
	if t > 0:
		P = float(input('Please enter the principal amount, P = $'))
		r = float(input('Please enter the constant annual interest rate in %, r = '))
		print("The future value of $%.2f principal invested in %.2f years at %.2f%% per annum is " % (P, t, r) + locale.currency(round(P*math.e**(r*t),2),grouping=True) + ".")
		year_condition = True
	else:
		print("The input for the number of years t is negative. Please re-enter a positive number.")
		year_condition = False
