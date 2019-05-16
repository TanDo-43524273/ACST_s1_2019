#[datemonthcomparison.py]
print("[datemonthcomparison.py]")
month_list=('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')
month_condition = False  # looping condition
while not month_condition:
	m = float(input('Please enter an integer for m: '))
	if m.is_integer():
		date_condition = False  # looping condition
		while not date_condition:
			d = float(input('Please enter an integer for d: '))
			month_condition = True
			if d.is_integer():
				date_condition = True
				m=int(m)
				d=int(d)
				if (m == 3 and d>=20 and d<=31) or (m == 6 and d>=1 and d<=20) or (m == 4 and d>=1 and d<=30) or (m == 5 and d>=1 and d<=31):
					print("True")
					print("The enterned input is day %d of " % (d) + month_list[m-1] +".")
				elif (d<1 or d>31) and (m>=1 and m<=12):
					print("False")
					print("%d is an invalid day input." % (d))
				elif (d>=1 and d<=31) and (m<1 or m>12):
					print("False")
					print("%d is an invalid month input." % (m))
				elif (d<1 or d>31) and (m<1 or m>12):
					print("False")
					print("%d and %d are invalid values for day and month." % (d, m))
				elif m==2 and (d<1 or d>29):
					print("False")
					print("%d is not a valid day for the month of " % (d) + month_list[m-1] +".")
				elif (m==1 or m==3 or m==5 or m==7 or m==8 or m==10 or m==12) and (d<1 or d>31):
					print("False")
					print("%d is not a valid day for the month of " % (d) + month_list[m-1] +".")
				elif (m==4 or m==6 or m==9 or m==11) and (d<1 or d>30):
					print("False")
					print("%d is not a valid day for the month of " % (d) + month_list[m-1] +".")
				else:
					print("False")
					print("The enterned input is day %d of " % (d) + month_list[m-1] +"."+" It is out of the required time range.")
			else:
				print("The enterned d is not an integer. Please re-enter an integer for d.")
				date_condition = False
	else:
		print("The enterned m is not an integer. Please re-enter an integer for m.")
		month_condition = False