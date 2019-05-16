#[leapyearcheck.py]
print("[leapyearcheck.py]")
y_condition = False  # looping condition
while not y_condition:
	year = float(input('Please enter a year: '))
	if year.is_integer() and year > 0:
		y_condition = True
		year=int(year)
		if (year % 4)==0:
			if (year % 100)==0:
				if (year % 400)==0:
					print("%d is a leap year." %(year))
				else:
					print("%d is not a leap year." %(year))
			else:
				print("%d is a leap year." %(year))
		else:
			print("%d is not a leap year." %(year))
	elif year.is_integer() and year <= 0:
		print("The enterned value is not a valid input for year. Please re-enter a positive integer for year.")
		y_condition = False
	else:
		print("The enterned value is not an integer. Please re-enter a positive integer for year.")
		y_condition = False