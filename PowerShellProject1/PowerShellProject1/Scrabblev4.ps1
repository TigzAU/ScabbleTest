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
# defined script level Variables
$ScrabbleBagTiles = @(65..90) + 94
$requiredtiles = 1
$ScrabbleBag = @()
$tilerack = @()
# defined functions
	
Function pickatile($CreatedBag){
	# pick a tiles function
		# while $scrabblebag count is > 0
			# get random tile from $scrabblebag
			# return tile
	While($CreatedBag -gt 0){
		$tile = Get-Random $CreatedBag
		Return $tile
	}
}
function removetilefrombag($pickedtile,$AlteringBag){
	# remove a tile from bag function
		# remove the tile that was recieved
		# return updated bag
	$AlteringBag = $AlteringBag -ne $pickedtile
	Return $AlteringBag
}
Function createabag($tilesymbol,$tilequantity,$makebag){
	# create a scrabble bag	function
		# Get a list of the type of tiles that should be in the bag
		# get a list of how many tiles of each type should be in the bag
		# add how many of each type to the bag
		# return the bag
	Foreach($burnedvar in 1..$tilequantity){
		$makebag += $tilesymbol
	}
	Return $makebag
}


# convert the tile to a alpha character from numeric
# return alpha character to array $tilerack
# return the $tilerack
# display those tiles
														


# ask user how many tiles were used and pick that many


# start program
	#remove Scrabble bag start count as its for testing only
	Write-Output "How many tiles start in bag "$ScrabbleBag.Count 
# foreach $tile in $requiredtiles
foreach($maketile in $ScrabbleBagTiles){
	$convertedtile = [char]$maketile
	$quanityoftile = (Get-Variable $convertedtile -ValueOnly).HowMany
	$ScrabbleBag = createabag $maketile $quanityoftile $ScrabbleBag
}
#remove Scrabble bag start count as its for testing only 
Write-Output "How many tiles start in bag "$ScrabbleBag.Count
Foreach($burnedvar1 in 1..$requiredtiles){
	$Tilegrab = pickatile $ScrabbleBag
	$ScrabbleBag = removetilefrombag $Tilegrab $ScrabbleBag
	$tilerack += $Tilegrab
}


####################### TEST START #######################
# Test output TEST Only - remove before prodution - Test output TEST Only
Write-Output "Tiles in rack "$tilerack
Write-Output "How many tiles in bag now "$ScrabbleBag.Count 
####################### TEST END #######################