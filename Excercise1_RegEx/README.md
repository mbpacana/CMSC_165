"# CMSC_165" 
##CMSC 176 Exercise 1 (Documentation)
###### by Michael Ervin Pacana & Marie Curie Salera

#####a) Tokenizes the text file with space as a delimiter.
#####b) Words separated with dash (-) is considered one (1) token (e.g. state-of-the-art).
#####c) The following punctuations are checked, counted and ommitted in tokenizing:
	.
	,
	:
	;
	!
	?
	'
	\
	-
	[
	]
	(
	)
	{
	}
#####d) In search, it follows the following rules:
-  The user can use the wildcards * which represents ONE or more character and ? which represents a single character.
- Multiple asterisk (\*) is invalid.
- Searching strings is limited only to alphanumeric characters, asterisk (\*) and question mark (?).
- Asterisk (\*) will represent at least  **ONE OR MORE CHARACTER** input.
- Search is case sensitive. It searches for all occurences in the original string. (Repeating strings will be displayed as long as it fits search requirements)