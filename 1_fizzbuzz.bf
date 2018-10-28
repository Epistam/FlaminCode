##############
# Memory map # 
##############

# commentaire : adopter une archi qui permet de concaténer fizz et buzz quand besoin au lieu d'un cas spécial fizzbuzz et triple ET pour afficher le chiffre

######################
# Value declarations #
######################

# Writing 'Fizz' at cell 120 to 124
>>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>>				# Get to cell 100
>>>>>>>>>> >>>>>>>>>>																										# Get to cell 120
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>														# F
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>					# i	
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>	# z
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>	# z
<<<< 																														# Go back to cell 120
<<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< 				# Go back to cell 20
<<<<<<<<<< <<<<<<<<<<																										# Go back to cell 0

# Writing 'Buzz' at cell 130 to 134
>>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>>				# Get to THE CHOPPER
>>>>>>>>>> >>>>>>>>>> >>>>>>>>>>																							# Get to cell 130
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>															# B
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>		# u
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>	# z 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>	# z
<<<<
<<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<<
<<<<<<<<<< <<<<<<<<<< <<<<<<<<<<



# Writing top bound for i at cell 100
>++++++++++ ++++++++++ ++++++++++ ++++++++++ ++++++++++ ++++++++++ ++++++++++ ++++++++++ ++++++++++ ++++++++++<

###########
# Program #
###########

[
	-<+															# Decrease lastnumber and increment i on cell 0 for each main loop iteration

	# Each division has its attributed range 
	# 10 to 29
	# 30 to 49
	# 50 to 69
	
	# For each comment on the general process cells will be referred to as if division was in the 10 to 29 range
	# For each repeated function making use of a given offset it will be put between parenthesis
	# All offsets will be separated in groups of 10 to make reading the "code" easier

	# Division check process is as follows
	# 1) Totally wiping target ranges to prevent any interference with current iterationn
	# 2) Copy i to 10
	# 3) Reset divider cell on 12 with correct value
 	# 4) Execute division process (without regard for original values destruction)
	# 5) Copy mod obtained on cell 13 to cell 16
	# 6) Convert mod on cell 16 and output logical bit (divisiblity) to cell 17
	# 7) Invert logical bit and output on cell 18
	# 8) Print necessary string according to current block's divisibility check
	
	# When division checks for 3 and 5 will be done deal with the 'non divisible' case

	##############################
	# Checking divisibility by 3 #
	##############################

		#######################
		# 1) Cleaning process #
		#######################
		
			>>>>>>>>>>											# Move to first cell block
			>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-] 			# Wiping cells 10 to 19
			>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]			# Wiping cells 20 to 29
			<<<<<<<<<< <<<<<<<<<<								# Going back to block beginning
			<<<<<<<<<<											# Going back to cell 0
		
		########################
		# 2) Copy i to cell 10 #
		########################

			# Copy i on cell 0 to cell 10 (using 9 as buffer)
			[													# Until original value = 0
				>>>>>>>>>+										# Incrementing buffer value on cell 9
				>+												# Incrementing final value on cell 10
				<<<<<<<<<<-										# Decrementing original value on cell 0 (so the loop ends at some point)
			]
			>>>>>>>>>											# Move to buffer value on cell 9 
			[-<<<<<<<<<+>>>>>>>>>]								# Transfer buffer value to original (til buffer value is 0)

			<<<<<<<<<											# Return to cell 0

		##############################
		# 3) Set dividers on cell 12 #
		##############################
		
			# Writing divider '3' to cell 12
			>>>>>>>>>> >>										# Get to cell 12
			+++													# Write 3
			<<<<<<<<<< <<										# Go back to cell 0
		
		###############################
		# 4) Execute division process #
		###############################

			# Dividing i by 3
			>>>>>>>>>>												# Moving to first cell block (cell 10)
			[
				->+>- 												# Transfering n on cell 10 to cell 11 (n buffer) by 1 on each iteration then decremating divider (cell 12)
				[>+>>]												# If divider != 0 increment div buffer (cell 13) then move to 14 (if divider = 0 staying on cell 11)
				>													# Move to cell 15 (resp 12)
				[													# If divider = 0 (same as while divider buffer != 0) (we're on cell 12 then)
					+												# Offset divider buffer by 1
					[-<+>]											# Move divider buffer to divider again
					>+>>											# Increment Q
				]
				<<<<<<												# Back to the beginning of cell group (cell 10)
			]
			++++++++++++++++++++++++++++++++++++++++++++++++		# Offset to printable ASCII
			.														# DEBUG : print cell 13 (aka i mod 3)
			------------------------------------------------		# Un offset to original value

		######################################################
		# 5) Copy mod and get ready for following operations #		 TODO reorganize cell block to reduce final size to 10 to 19 ; move 13 to 11 ; clean the rest
		######################################################

			>>>[>>>+<<<-]>>>											# Transfer cell 13 to cell 16 and move back to cell 16
			++++++++++++++++++++++++++++++++++++++++++++++++
			.														# DEBUG : print cell 16 (aka verify transfer is successful so still i mod 3)
			------------------------------------------------

		##############################################
		# 6) Convert mod to divisibility logical bit #
		##############################################

			# Convert numeric mod to logical value and output at bit 17
			>+>+>+>+ <<<<  											# Set cells 17 to 20 to 1 so the loop keeps going to cell 21 (harmonized offset from different condition branches)
			[>+>]> 													# Increment next bit by 1 if cell 16 is non zero ; ends up either at cell 20 or 17
			[>] 													# Seek next 0 aka cell 21 regardless of the previous value 
			<[-]<[-]<[-]											# Clean the mess on cells 20 to 18 on the way back to 17
			<- 														# Back to cell 17 substract 1 to get actualy result
			++++++++++++++++++++++++++++++++++++++++++++++++
			.														# DEBUG : print cell 17 (aka verify if bit conversion is done correctly)
			------------------------------------------------

			>>>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>> ++++++++++ ++++++++++++ . <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< \n

		##############################
		# 7) Invert divisibility bit #
		##############################

			# Inverting logical bit on cell 17 to make the condition easier to write (output to cell 18)
			[
				>-													# Set cell 18 to minus 1 if cell 17 is 0 ; leave it to 0 otherwise
				<-													# If cell 17 is 1 then lower it down to 0
			]
			>+														# Shift cell 18 by 1 bit (magic happens here)

		##############################
		# 8) Print necessary message #
		##############################

			[														# Print appropriate message if cell 18 says true (1)
				
				<<<<<<<<<< <<<<<<<< 								# Get back to cell 0
				>>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>>
				>>>>>>>>>> >>>>>>>>>> 								# Get to cell 120
				[.>] <<<< 											# Print word ; come back to string beginning
				<<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< 
				<<<<<<<<<< <<<<<<<<<<								# Get back to cell 0 
				>>>>>>>>>> >>>>>>>>									# Get to cell 18

				>+<-												# Decrement bit at 18 to get out of the loop ; keep the info on cell 19
			]
			<<<<<<<<< <<<<<<<<<										# Get back to cell 0

	##############################
	# Checking divisibility by 5 #	TODO adjust offsets so that switching cell blocks only results in shift at the beginning of the block
	##############################


		#######################
		# 1) Cleaning process #
		#######################
		
			(>>>>>>>>>> >>>>>>>>>>) >>>>>>>>>>					# Move to 2nd cell block
			>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-] 			# Wiping cells 10 to 19
			>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]			# Wiping cells 20 to 29
			<<<<<<<<<< <<<<<<<<<<								# Going back to block beginning
			(<<<<<<<<<< <<<<<<<<<<) <<<<<<<<<<					# Going back to cell 0

		########################
		# 2) Copy i to cell 20 #
		########################
		
			# Copy i on cell 0 to cell 10 (using 9 as buffer)
			[													# Until original value = 0
				(>>>>>>>>>> >>>>>>>>>>) >>>>>>>>>+				# Incrementing buffer value on cell 9
				>+												# Incrementing final value on cell 10
				(<<<<<<<<<< <<<<<<<<<<) <<<<<<<<<<-				# Decrementing original value on cell 0 (so the loop ends at some point)
			]
			(>>>>>>>>>> >>>>>>>>>>) >>>>>>>>>					# Move to buffer value on cell 9 
			[-<<<<<<<<< (<<<<<<<<<< <<<<<<<<<<) + (>>>>>>>>>> >>>>>>>>>>) >>>>>>>>>]	# Transfer buffer value to original (til buffer value is 0)

			(<<<<<<<<<< <<<<<<<<<<) <<<<<<<<<					# Return to cell 0
		
		##############################
		# 3) Set dividers on cell 12 #
		##############################
			# Writing divider '5' to cell 32
			(>>>>>>>>>> >>>>>>>>>>) >>>>>>>>>> >>				# Get to cell 32
			+++													# Write 5
			(<<<<<<<<<< <<<<<<<<<<) <<<<<<<<<< <<				# Go back to cell 0
		###############################
		# 4) Execute division process #
		###############################

			# Dividing i by 5
			(>>>>>>>>>> >>>>>>>>>>) >>>>>>>>>>						# Moving to first cell block (cell 10)
			[
				->+>- 												# Transfering n on cell 10 to cell 11 (n buffer) by 1 on each iteration then decremating divider (cell 12)
				[>+>>]												# If divider != 0 increment div buffer (cell 13) then move to 14 (if divider = 0 staying on cell 11)
				>													# Move to cell 15 (resp 12)
				[													# If divider = 0 (same as while divider buffer != 0) (we're on cell 12 then)
					+												# Offset divider buffer by 1
					[-<+>]											# Move divider buffer to divider again
					>+>>											# Increment Q
				]
				<<<<<<												# Back to the beginning of cell group (cell 10)
			]
			++++++++++++++++++++++++++++++++++++++++++++++++		# Offset to printable ASCII
			.														# DEBUG : print cell 13 (aka i mod 3)
			------------------------------------------------		# Un offset to original value

		######################################################
		# 5) Copy mod and get ready for following operations #		 TODO reorganize cell block to reduce final size to 10 to 19 ; move 13 to 11 ; clean the rest
		######################################################

			>>>[>>>+<<<-]>>>											# Transfer cell 13 to cell 16 and move back to cell 16
			++++++++++++++++++++++++++++++++++++++++++++++++
			.														# DEBUG : print cell 16 (aka verify transfer is successful so still i mod 3)
			------------------------------------------------

		##############################################
		# 6) Convert mod to divisibility logical bit # TODO : offset bug lurking somewhere around here
		##############################################

			# Convert numeric mod to logical value and output at bit 17
			>+>+>+>+ <<<<  											# Set cells 17 to 20 to 1 so the loop keeps going to cell 21 (harmonized offset from different condition branches)
			[>+>]> 													# Increment next bit by 1 if cell 16 is non zero ; ends up either at cell 20 or 17
			[>] 													# Seek next 0 aka cell 21 regardless of the previous value 
			<[-]<[-]<[-]											# Clean the mess on cells 20 to 18 on the way back to 17
			<- 														# Back to cell 17 substract 1 to get actual result
			++++++++++++++++++++++++++++++++++++++++++++++++
			.														# DEBUG : print cell 17 (aka verify if bit conversion is done correctly)
			------------------------------------------------

			>>>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>> ++++++++++ ++++++++++++ . <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< \n

		##############################
		# 7) Invert divisibility bit #
		##############################

			# Inverting logical bit on cell 17 to make the condition easier to write (output to cell 18)
			[
				>-													# Set cell 18 to minus 1 if cell 17 is 0 ; leave it to 0 otherwise
				<-													# If cell 17 is 1 then lower it down to 0
			]
			>+														# Shift cell 18 by 1 bit (magic happens here)

		##############################
		# 8) Print necessary message #
		##############################

			[														# Print appropriate message if cell 18 says true (1)
				<<<<<<<<<< (<<<<<<<<<< <<<<<<<<<<) <<<<<<<< 		# Get back to cell 0
				>>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>> >>>>>>>>>>
				>>>>>>>>>> >>>>>>>>>> >>>>>>>>>> 					# Get to cell 130
				[.>] <<<< 											# Print word ; come back to string beginning
				<<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< <<<<<<<<<< 
				<<<<<<<<<< <<<<<<<<<< <<<<<<<<<<					# Get back to cell 0 
				>>>>>>>>>> (>>>>>>>>>> >>>>>>>>>>) >>>>>>>>			# Get to cell 18

				>+<-												# Decrement bit at 18 to get out of the loop ; keep the info on cell 19
			]
			<<<<<<<<< <<<<<<<<<	(<<<<<<<<<< <<<<<<<<<<)				# Get back to cell 0


	
	#############################
	# Checking non-divisibility #
	#############################
	
	# Reuse variables preserved divisibility variables and use AND to print number if it is not divisible by 3 nor 5

	>														# Returning to cell 1
]
