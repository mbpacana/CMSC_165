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

<<<<<<< HEAD
my @puncList = ('\.', ',', ':', ';', '!', '\?', '\'', '"', '-', '\[', '\]', '\(', '\)', '\{', '\}');
my @printPuncList = (".", ",", ":", ";", "!", "?", '"', "'", "-", "[", "]", "(", ")", "{", "}");
my @arrayPuncCount = ();

my $arrayString = (".safa.potato,hehehehe , someomfa:"); 
my $size = scalar @puncList;

my $find;
my $count = 0;
my $maxIndex = -1;
for(my $i = 0 ; $i < $size ; $i = $i + 1){
   $find = $puncList[$i];
   $count = () = $arrayString =~ m(($find))g;
   $arrayPuncCount[$i] = $count;

   $count = 0;
}
=======
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


>>>>>>> cf2f9e9a69187ef2313e0ffe29368cdb8d53a4b0
for (my $i = 0; $i < $size; $i++) {
	if($arrayPuncCount[$i] > 0){
		say $printPuncList[$i], " ", $arrayPuncCount[$i];
	}
}
