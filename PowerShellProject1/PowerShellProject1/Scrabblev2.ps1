<#..
# Scrabble.ps1
# Scrabble table of points and tile amounts
# 2 blank tiles (scoring 0 points)
# 1 point: E ×12, A ×9, I ×9, O ×8, N ×6, R ×6, T ×6, L ×4, S ×4, U ×4
# 2 points: D ×4, G ×3
# 3 points: B ×2, C ×2, M ×2, P ×2
# 4 points: F ×2, H ×2, V ×2, W ×2, Y ×2
# 5 points: K ×1
# 8 points: J ×1, X ×1
# 10 points: Q ×1, Z ×1
..#>

# Hashtag - HashTable
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

# Function to get a random letter and return a single one
Function RandomLetter ($ScrabbleBag) {
	$GrabATile = Get-Random -InputObject $ScrabbleBag
	Return $GrabATile
}

# Function to find out if the random letter chosen is in my Scrabble Bag
Function IsLetterInBag ($GrabbedTile) {
	$ConvertToCharacter = [Char]$GrabbedTile
	$TilesLeft = (Get-Variable $ConvertToCharacter -ValueOnly).HowMany
	If($TilesLeft -ne 0){
		(Get-Variable $ConvertToCharacter -ValueOnly).HowMany --
		Return $true
	}Else{
		Return $false
	}
}

#Define an array
$ScrabbleRack = $null
$NeededTiles = 7
# Loop to combine functions of a random tile and confirm that it exists and send this to my scrabble rack
$ScrabbleBagTiles = @(94) + 65..90
$TileExists = $false
Foreach($Scrabble in 1..$NeededTiles){
While($TileExists -eq $false){
	$GrabATile = RandomLetter $ScrabbleBagTiles
	$TileExists = IsLetterInBag $GrabATile
}
	$RackCharacterCovert = [Char]$GrabATile
    $ScrabbleRack += "$RackCharacterCovert"
    $TileExists = $false
}

$HowManyLeft =@()
# Display the Information 
Foreach($Tile in $ScrabbleBagTiles){
       $ConvertToLetter = [Char]$Tile
       $HowManyLeft += ((Get-Variable $ConvertToLetter).Name+" = "+(Get-Variable $ConvertToLetter -ValueOnly).HowMany)
}

Write-Output $ScrabbleRack
Write-Output $HowManyLeft