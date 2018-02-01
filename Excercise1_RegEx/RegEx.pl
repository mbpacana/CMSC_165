#Michael Ervin Pacaña
#Marie Curie Salera

use strict;
use warnings;
use diagnostics;
 
use feature "switch";
use v5.16;

#Initial declarations
my $file_path = "test.txt";
my @puncList = ('\.', ',', ':', ';', '!', '\?', '\'', '\"', '-', '\[', '\]', '\(', '\)', '\{', '\}');
my @printPuncList = (".", ",", ":", ";", "!", "?", "'", '"', "-", "[", "]", "(", ")", "{", "}");
my @arrayPuncCount = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
my $size = scalar @puncList;

open my $file_handler, '<' , $file_path or die "Unable to open $file_path for reading: $!";

my @array_of_words;
my @words; 
my $wordsSize;
my $flagPunc = 0; 

#Tokenizing words
#a) Tokenizes the text file with space as a delimiter.
#b) Words separated with dash (-) is considered one (1) token (e.g. state-of-the-art).

while(my $info = <$file_handler>){
	chomp($info);
	#counting punctuation
	count_punctuation($info, $size);
	my @words = split / /, $info;
	my $wordsSize = scalar @words;
	for (my $i = 0; $i < $wordsSize; $i++) {
		$words[$i] =~ s/[\.,:;!\?\'"[\](\){\}-]+//g;
	}
	push(@array_of_words,@words);
}

#Tokens
@array_of_words = grep /\S/, @array_of_words;
my $items = scalar @array_of_words;
say "Number of tokens: ", $items;

close($file_handler);	

#Types 
sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

my @filteredTypes = uniq map lc, @array_of_words;
my $type = scalar @filteredTypes; 

say "Number of types: ", $type; 
say "Punctuations found: "; 
#c) The following punctuations are checked, counted and ommitted in tokenizing:  (".", ",", ":", ";", "!", "?", "'", '"', "-", "[", "]", "(", ")", "{", "}");
sub count_punctuation {
	my ($string, $size) = @_;
	my $find;
	my $count = 0;
	my $maxIndex = -1;
	for(my $i = 0 ; $i < $size ; $i = $i + 1){
	   $find = $puncList[$i];
	   $count = () = $string =~ m(($find))g;
	   if($count != 0){
	   		$flagPunc = 1;	
	   }
	   $arrayPuncCount[$i] += $count;
	   $count = 0;
	}
}
if($flagPunc == 0){
	say "No valid punctuations";
}

for (my $i = 0; $i < $size; $i++) {
	if($arrayPuncCount[$i] > 0){
		say $printPuncList[$i], " ", $arrayPuncCount[$i];
	}
}
#If backend tokens are to be accessed, erase GHOSTCODE and cut. 
=begin GHOSTCODE
print ("\nEnter '1' to display tokens | Enter '2' to display types | Enter '3' to display both | Enter any key to continue ");
my $displayChoice= <STDIN>;
chomp($displayChoice);

if($displayChoice eq "1" ){
	print("TOKENS: ");
	print("@array_of_words\n");
}elsif($displayChoice eq "2" ){
	print("TYPES: ");
	print("@filteredTypes\n");
}elsif($displayChoice eq "3" ){
	print("TOKENS: ");
	print("@array_of_words\n");
	print("TYPES: ");
	print("@filteredTypes\n");
}
=cut

#Searching words
my $search;
print ("\nEnter 'exit' to exit program | Enter word to search: ");
$search= <STDIN>;
chomp($search);
#d) In search, it follows the following rules:
#-  The user can use the wildcards * which represents ONE or more character and ? which represents a single character.
#- Multiple asterisk (\*) is invalid.
#- Searching strings is limited only to alphanumeric characters, asterisk (\*) and question mark (?).
#- Asterisk (\*) will represent at least  **ONE OR MORE CHARACTER** input.

while($search ne "exit"){
	
	$search =~ s/\?/[0-9a-zA-Z]/g;
	$search =~ s/\*/.+/g;
	
	for (my $i = 0; $i < @array_of_words; $i++) {
		if($array_of_words[$i] =~ /^$search$/){
			say "Found: ", $array_of_words[$i] ;
		}
	}
	print ("\nEnter 'exit' to exit program | Enter word to search: ");
	$search= <STDIN>;
	chomp($search);
}

say "Program Terminated";