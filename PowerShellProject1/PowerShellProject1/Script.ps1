#
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

$^=@{Count=2;Score=0}
$E=@{Count=12;Score=1}
$A=@{Count=9;Score=1}
$I=@{Count=9;Score=1}
$O=@{Count=8;Score=1}
$N=@{Count=6;Score=1}
$R=@{Count=6;Score=1}
$T=@{Count=6;Score=1}
$L=@{Count=4;Score=1}
$S=@{Count=4;Score=1}
$U=@{Count=4;Score=1}
$D=@{Count=4;Score=2}
$G=@{Count=3;Score=2}
$B=@{Count=2;Score=3}
$C=@{Count=2;Score=3}
$M=@{Count=2;Score=3}
$P=@{Count=2;Score=3}
$F=@{Count=2;Score=4}
$H=@{Count=2;Score=4}
$V=@{Count=2;Score=4}
$W=@{Count=2;Score=4}
$Y=@{Count=2;Score=4}
$K=@{Count=1;Score=5}
$J=@{Count=1;Score=8}
$X=@{Count=1;Score=8}
$Q=@{Count=1;Score=10}
$Z=@{Count=1;Score=10}

$ScrabbleBag=@(A..Z;^)
$rnd=@(Get-Random -InputObject $ScrabbleBag -Count 7)
Function RndCheck{
	Foreach($element in $rnd){
		If($element -eq "A"){
			If($A.Count -eq 0){
				$Reselect = (Get-Random -InputObject $ScrabbleBag -Count 1)
				While($Reselect -ceq "A"){
					$Reselect = (Get-Random -InputObject $ScrabbleBag -Count 1)	
				}
				$element = $Reselect
				Return $element
				}
			}Else{
				$A.Count = $A.Count - 1
			}
		}
	}
}




