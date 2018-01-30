use strict;
use warnings;
use diagnostics;
 
use feature "switch";
use v5.16;

my $file_path = "test.txt";
my @puncList = ('\.', ',', ':', ';', '!', '\?', '\'', '"', '-', '\[', '\]', '\(', '\)', '\{', '\}');
my @printPuncList = (".", ",", ":", ";", "!", "?", "'", "'", "-", "[", "]", "(", ")", "{", "}");
my @arrayPuncCount = ();

my $size = scalar @puncList;
open my $file_handler, '<' , $file_path or die "Unable to open $file_path for reading: $!";

my @array_of_words; 

while(my $info = <$file_handler>){
	chomp($info);
	count_punctuation($info, $size);
	my @words = split / /, $info;
	push(@array_of_words,@words);
}

for(@array_of_words){
	say $_;
}

my $items = scalar @array_of_words;
say "Number of tokens: ", $items;

close($file_handler);	

sub count_punctuation {
	my ($string, $size) = @_;
	my $find;
	my $count = 0;
	my $maxIndex = -1;
	for(my $i = 0 ; $i < $size ; $i = $i + 1){
	   $find = $puncList[$i];
	   $count = () = $string =~ m(($find))g;
	   $arrayPuncCount[$i] = $count;
	   $count = 0;
	}
}


for (my $i = 0; $i < $size; $i++) {
	if($arrayPuncCount[$i] > 0){
		say $printPuncList[$i], " ", $arrayPuncCount[$i];
	}
}
