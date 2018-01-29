use strict;
use warnings;
use diagnostics;
 
use feature "switch";
use v5.16;

my $file_path = "test.txt";
open my $file_handler, '<' , $file_path or die "Unable to open $file_path for reading: $!";

my @array_of_words; 

while(my $info = <$file_handler>){
	chomp($info);
	my @words = split / /, $info;
	push(@array_of_words,@words);
}

for(@array_of_words){
	say $_;
}

my $items = scalar @array_of_words;
say "Number of tokens: ", $items;

 close($file_handler)	