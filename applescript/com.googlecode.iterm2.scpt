tell application "iTerm"	set loc to name of first windowend tellset loc to ((characters ((offset of ": " in loc) + 2) thru -1 of loc) as string)set loc to ((characters 1 thru ((last_offset(loc, "(") - 2)) of loc) as string)set loc to replace(" ", "_", loc)return locon replace(A, B, theText)	set L to length of A	set K to L - 1	set P to offset of A in theText	repeat until P = 0		if P = 1 then			set theText to B & text (L + 1) through -1 of theText		else if P = (length of theText) - K then			set theText to text 1 through -(L + 1) of theText & B		else			set theText to text 1 through (P - 1) of theText & B & text (P + L) through -1 of theText		end if		set P to offset of A in theText	end repeat	return theTextend replaceon last_offset(the_text, char)	try		set i to 1		set last_occurrence to 0		repeat count of the_text times			if item i of the_text as string = char then				set last_occurrence to i			end if			set i to i + 1		end repeat	on error		return 0	end try	return last_occurrenceend last_offset