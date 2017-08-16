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

# Create Statement to ensure that my array doesnt exceed 7 items
#If($ScrabbleRack.Count -ne 7){
#	$RackCharacterCovert = [Char]$GrabATile
#    $ScrabbleRack += $RackCharacterCovert
#}

$HowManyLeft =@()
# Display the Information 
Foreach($Tile in $ScrabbleBagTiles){
       $ConvertToLetter = [Char]$Tile
       $HowManyLeft += ((Get-Variable $ConvertToLetter).Name+" = "+(Get-Variable $ConvertToLetter -ValueOnly).HowMany)
}

Write-Output $ScrabbleRack
Write-Output $HowManyLeft

Add-Type -AssemblyName  System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$ScrabbleForm = New-Object system.Windows.Forms.Form
$ScrabbleBrush = New-Object Drawing.SolidBrush White
$scrabblePen = New-Object Drawing.Pen Black
$ScrabbleForm.Size = New-Object System.Drawing.Size(380,100)
$ScrabbleFont = new-object System.Drawing.Font("Verdana", 20) 
$ScrabbleTBrush = New-Object Drawing.SolidBrush Red   
$ScrabbleGraphics = $ScrabbleForm.CreateGraphics()
$ScrabbleForm.Width = 380
$ScrabbleForm.Height = 360
$LblTile1 = New-Object System.Windows.Forms.Label
$LblTile1.Height = 40
$LblTile1.Width = 40
$LblTile1.Location = New-Object System.Drawing.Size(10,10)
$LblTile1.BackColor = ([System.Drawing.Color]::White)
$LblTile1.BorderStyle = ([System.Windows.Forms.BorderStyle]::Fixed3D)
$LblTile1.Text = $ScrabbleRack[0]
$LblTile1.TextAlign = "MiddleCenter"
$LblTile1.Font = $ScrabbleFont
$LblTile1.ForeColor = ([System.Drawing.Color]::DarkCyan)
$ScrabbleForm.add_paint(
{
$LineV1XStart = 50
$LineV1YStart = 10
$LineV1XEnd = 50
$LineV1YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineV1XStart, $LineV1YStart, $LineV1XEnd, $LineV1YEnd)
$LineH1XStart = 10
$LineH1YStart = 50
$LineH1XEnd = 50
$LineH1YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineH1XStart, $LineH1YStart, $LineH1XEnd, $LineH1YEnd)
$ScrabbleGraphics.FillRectangle($ScrabbleBrush, 60,10,40,40)
$LineV2XStart = 100
$LineV2YStart = 10
$LineV2XEnd = 100
$LineV2YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineV2XStart, $LineV2YStart, $LineV2XEnd, $LineV2YEnd)
$LineH2XStart = 60
$LineH2YStart = 50
$LineH2XEnd = 100
$LineH2YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineH2XStart, $LineH2YStart, $LineH2XEnd, $LineH2YEnd)
$ScrabbleGraphics.DrawString($ScrabbleRack[1],$ScrabbleFont,$ScrabbleTBrush, 67, 14)
$ScrabbleGraphics.FillRectangle($ScrabbleBrush, 110,10,40,40)
$LineV3XStart = 150
$LineV3YStart = 10
$LineV3XEnd = 150
$LineV3YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineV3XStart, $LineV3YStart, $LineV3XEnd, $LineV3YEnd)
$LineH3XStart = 110
$LineH3YStart = 50
$LineH3XEnd = 150
$LineH3YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineH3XStart, $LineH3YStart, $LineH3XEnd, $LineH3YEnd) 
$ScrabbleGraphics.DrawString($ScrabbleRack[2],$ScrabbleFont,$ScrabbleTBrush, 117, 14)
$ScrabbleGraphics.FillRectangle($ScrabbleBrush, 160,10,40,40)
$LineV4XStart = 200
$LineV4YStart = 10
$LineV4XEnd = 200
$LineV4YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineV4XStart, $LineV4YStart, $LineV4XEnd, $LineV4YEnd)
$LineH4XStart = 160
$LineH4YStart = 50
$LineH4XEnd = 200
$LineH4YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineH4XStart, $LineH4YStart, $LineH4XEnd, $LineH4YEnd)
$ScrabbleGraphics.DrawString($ScrabbleRack[3],$ScrabbleFont,$ScrabbleTBrush, 167, 14)
$ScrabbleGraphics.FillRectangle($ScrabbleBrush, 210,10,40,40)
$LineV5XStart = 250
$LineV5YStart = 10
$LineV5XEnd = 250
$LineV5YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineV5XStart, $LineV5YStart, $LineV5XEnd, $LineV5YEnd)
$LineH5XStart = 210
$LineH5YStart = 50
$LineH5XEnd = 250
$LineH5YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineH5XStart, $LineH5YStart, $LineH5XEnd, $LineH5YEnd)
$ScrabbleGraphics.DrawString($ScrabbleRack[4],$ScrabbleFont,$ScrabbleTBrush, 217, 14)
$ScrabbleGraphics.FillRectangle($ScrabbleBrush, 260,10,40,40)
$LineV6XStart = 300
$LineV6YStart = 10
$LineV6XEnd = 300
$LineV6YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineV6XStart, $LineV6YStart, $LineV6XEnd, $LineV6YEnd)
$LineH6XStart = 260
$LineH6YStart = 50
$LineH6XEnd = 300
$LineH6YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineH6XStart, $LineH6YStart, $LineH6XEnd, $LineH6YEnd)
$ScrabbleGraphics.DrawString($ScrabbleRack[5],$ScrabbleFont,$ScrabbleTBrush, 267, 14)
$ScrabbleGraphics.FillRectangle($ScrabbleBrush, 310,10,40,40)
$LineV7XStart = 350
$LineV7YStart = 10
$LineV7XEnd = 350
$LineV7YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineV7XStart, $LineV7YStart, $LineV7XEnd, $LineV7YEnd)
$LineH7XStart = 310
$LineH7YStart = 50
$LineH7XEnd = 350
$LineH7YEnd = 50
$ScrabbleGraphics.DrawLine($ScrabblePen, $LineH7XStart, $LineH7YStart, $LineH7XEnd, $LineH7YEnd)
$ScrabbleGraphics.DrawString($ScrabbleRack[6],$ScrabbleFont,$ScrabbleTBrush, 317, 14)
}
)
$ScrabbleForm.Controls.Add($LblTile1)
$ScrabbleForm.ShowDialog()