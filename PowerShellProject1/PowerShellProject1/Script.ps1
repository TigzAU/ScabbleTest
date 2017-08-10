<#..
# Script.ps1
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

#Define Variables - if needing to be pre-defined
#New-Variable TileExists -Scope Global -Value $false -Description "Does my Tile Exist? (Boolean)"

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

<#.. Dont look at the green below - first attempt.
#$ScrabbleBag=@(A..Z;^)
#$rnd=@(Get-Random -InputObject $ScrabbleBag -Count 7)
#Function RndCheck{
#	Foreach($element in $rnd){
#		If($element -eq "A"){
#			If($A.Count -eq 0){
#				$Reselect = (Get-Random -InputObject $ScrabbleBag -Count 1)
#				While($Reselect -ceq "A"){
#					$Reselect = (Get-Random -InputObject $ScrabbleBag -Count 1)	
#				}
#				$element = $Reselect
#				Return $element
#				}
#			}Else{
#				$A.Count = $A.Count - 1
#			}
#		}
#	}
#}
..#>

# Function to get a random letter and return a single one
Function RandomLetter {
	#New-Variable ScrabbleBag -Description "A Variable to hold my Scrabble Tiles"
	#New-Variable GrabATile -Scope Global -Description "Grab a Tile out of my Scrabble Bag"
	#Set-Variable ScrabbleBag -Value 65..90,94
	#Set-variable GrabATile -Value Get-Random -InputObject $ScrabbleBag
	
	$ScrabbleBag = @(94) + 65..90
	$GrabATile = Get-Random -InputObject $ScrabbleBag
	Return $GrabATile
}

# Function to find out if the random letter chosen is in my Scrabble Bag
Function IsLetterInBag {
	New-Variable ConvertToCharacter
	Set-Variable ConvertToCharacter -Value [Char]::Parse($GrabATile)
	Switch ($ConvertToCharacter){
		A{Set-Variable TilesLeft -Value $A.HowMany}
		B{Set-Variable TilesLeft -Value $B.HowMany}
		C{Set-Variable TilesLeft -Value $C.HowMany}
		D{Set-Variable TilesLeft -Value $D.HowMany}
		E{Set-Variable TilesLeft -Value $E.HowMany}
		F{Set-Variable TilesLeft -Value $F.HowMany}
		G{Set-Variable TilesLeft -Value $G.HowMany}
		H{Set-Variable TilesLeft -Value $H.HowMany}
		I{Set-Variable TilesLeft -Value $I.HowMany}
		J{Set-Variable TilesLeft -Value $J.HowMany}
		K{Set-Variable TilesLeft -Value $K.HowMany}
		L{Set-Variable TilesLeft -Value $L.HowMany}
		M{Set-Variable TilesLeft -Value $M.HowMany}
		N{Set-Variable TilesLeft -Value $N.HowMany}
		O{Set-Variable TilesLeft -Value $O.HowMany}
		P{Set-Variable TilesLeft -Value $P.HowMany}
		Q{Set-Variable TilesLeft -Value $Q.HowMany}
		R{Set-Variable TilesLeft -Value $R.HowMany}
		S{Set-Variable TilesLeft -Value $S.HowMany}
		T{Set-Variable TilesLeft -Value $T.HowMany}
		U{Set-Variable TilesLeft -Value $U.HowMany}
		V{Set-Variable TilesLeft -Value $V.HowMany}
		W{Set-Variable TilesLeft -Value $W.HowMany}
		X{Set-Variable TilesLeft -Value $X.HowMany}
		Y{Set-Variable TilesLeft -Value $Y.HowMany}
		Z{Set-Variable TilesLeft -Value $Z.HowMany}
		^{Set-Variable TilesLeft -Value $^.HowMany}
	}
	New-Variable TileExists
	If($TilesLeft -ne 0){
		Switch ($ConvertToCharacter){
			A{$A.HowMany = $A.HowMany - 1}
			B{$B.HowMany = $B.HowMany - 1}
			C{$C.HowMany = $C.HowMany - 1}
			D{$D.HowMany = $D.HowMany - 1}
			E{$E.HowMany = $E.HowMany - 1}
			F{$F.HowMany = $F.HowMany - 1}
			G{$G.HowMany = $G.HowMany - 1}
			H{$H.HowMany = $H.HowMany - 1}
			I{$I.HowMany = $I.HowMany - 1}
			J{$J.HowMany = $J.HowMany - 1}
			K{$K.HowMany = $K.HowMany - 1}
			L{$L.HowMany = $L.HowMany - 1}
			M{$M.HowMany = $M.HowMany - 1}
			N{$N.HowMany = $N.HowMany - 1}
			O{$O.HowMany = $O.HowMany - 1}
			P{$P.HowMany = $P.HowMany - 1}
			Q{$Q.HowMany = $Q.HowMany - 1}
			R{$R.HowMany = $R.HowMany - 1}
			S{$S.HowMany = $S.HowMany - 1}
			T{$T.HowMany = $T.HowMany - 1}
			U{$U.HowMany = $U.HowMany - 1}
			V{$V.HowMany = $V.HowMany - 1}
			W{$W.HowMany = $W.HowMany - 1}
			X{$X.HowMany = $X.HowMany - 1}
			Y{$Y.HowMany = $Y.HowMany - 1}
			Z{$Z.HowMany = $Z.HowMany - 1}
			^{$^.HowMany = $^.HowMany - 1}
		}
		Set-Variable TileExists -Value $true
		Return $TileExists
	}Else{
		Set-Variable TileExists -Value $false
		Return $TileExists
	}
}

# Loop to combine functions of a random tile and confirm that it exists and send this to my scrabble rack
While($TileExists -eq $false){
	RandomLetter
	IsLetterInBag
}

#Define an array
$ScrabbleRack = @()

# Create Statement to ensure that my array doesnt exceed 7 items
While($ScrabbleRack -ne 7){

}


