# #table (used to hold starting information)
$^=@{HowMany=2;Score=0}
$E=@{HowMany=12;Score=1}
$A=@{HowMany=9;Score=1}
$I=@{HowMany=9;Score=1}
$O=@{HowMany=8;Score=1}
$N=@{HowMany=6;Score=1}
$R=@{HowMany=6;Score=1}
$T=@{HowMany=6;Score=1}
$L=@{HowMany=4;Score=1}
$S=@{HowMany=4;Score=1}
$U=@{HowMany=4;Score=1}
$D=@{HowMany=4;Score=2}
$G=@{HowMany=3;Score=2}
$B=@{HowMany=2;Score=3}
$C=@{HowMany=2;Score=3}
$M=@{HowMany=2;Score=3}
$P=@{HowMany=2;Score=3}
$F=@{HowMany=2;Score=4}
$H=@{HowMany=2;Score=4}
$V=@{HowMany=2;Score=4}
$W=@{HowMany=2;Score=4}
$Y=@{HowMany=2;Score=4}
$K=@{HowMany=1;Score=5}
$J=@{HowMany=1;Score=8}
$X=@{HowMany=1;Score=8}
$Q=@{HowMany=1;Score=10}
$Z=@{HowMany=1;Score=10}
# define Variables
$ScrabbleBagTiles = @(65..90) + 94
$requiredtiles = 7
# define functions
	
Function pickxtiles{
	# pick X tiles function
		# while $scrabblebag count is > 0
			# foreach $tile in $requiredtiles
				# get random tile from $scrabblebag
				# remove the tile that was recieved
				# convert the tile to a alpha character from numeric
				# return alpha character to array $tilerack
			# return the $tilerack
}
Function createabag {
	# create a scrabble bag	function
	# 
	
}
# display those tiles
														


# ask user how many tiles were used and pick that many


# start program
	#remove Scrabble bag start count as its for testing only
	Write-Output "How many tiles start in bag "$ScrabbleBag.Count 
createabag $ScrabbleBagTiles
pickxtiles



####################### TEST START #######################
# Test output TEST Only - remove before prodution - Test output TEST Only
Write-Output "Tiles in rack "$tilerack
Write-Output "How many tiles in bag now "$ScrabbleBag.Count 
####################### TEST END #######################