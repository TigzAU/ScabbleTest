$gap = 10
$width = 40
$height = 40
 
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
#      $RackCharacterCovert = [Char]$GrabATile
#    $ScrabbleRack += $RackCharacterCovert
#}
 
$HowManyLeft =@()
# Display the Information
Foreach($Tile in $ScrabbleBagTiles){
       $ConvertToLetter = [Char]$Tile
       $HowManyLeft += ((Get-Variable $ConvertToLetter).Name+" = "+(Get-Variable $ConvertToLetter -ValueOnly).HowMany)
}
 
Add-Type -AssemblyName  System.Windows.Forms
Add-Type -AssemblyName System.Drawing
 
$ScrabbleForm = New-Object system.Windows.Forms.Form
$ScrabbleForm.Size = New-Object System.Drawing.Size(380,100)
$ScrabbleForm.Width = 380
$ScrabbleForm.Height = 360
$ScrabbleForm.Font = new-object System.Drawing.Font("Verdana", 20)
 
$ScrabbleBrush = New-Object Drawing.SolidBrush White
$scrabblePen = New-Object Drawing.Pen Black
$ScrabbleTBrush = New-Object Drawing.SolidBrush Red  
$ScrabbleGraphics = $ScrabbleForm.CreateGraphics()
 
$LblTile1 = New-Object System.Windows.Forms.label
$LblTile2 = New-Object System.Windows.Forms.label
$LblTile3 = New-Object System.Windows.Forms.label
$LblTile4 = New-Object System.Windows.Forms.label
$LblTile5 = New-Object System.Windows.Forms.label
$LblTile6 = New-Object System.Windows.Forms.label
$LblTile7 = New-Object System.Windows.Forms.label
 
 
ForEach ($number in 1..7){
    $varName = "lbltile" + $number
   
    $object = Get-Variable -Name $varName -ValueOnly
 
    $object.text = $ScrabbleRack[($number - 1)]
    $object.TextAlign = "MiddleCenter"
    $object.ForeColor = ([System.Drawing.Color]::DarkCyan)
    $object.BackColor = ([System.Drawing.Color]::White)
    $object.BorderStyle = ([System.Windows.Forms.BorderStyle]::Fixed3D)
    $object.Height = $height
    $object.Width = $width
 
    $XLoc = $gap + (($width + $gap) * ($number -1))
    $object.Location = New-Object System.Drawing.Size($XLoc,$gap)

    $ScrabbleForm.Controls.Add($object)
}
 
 
 
$ScrabbleForm.add_paint(
{

Foreach($vnumber in 1..7){
    
    $varpass = "linevert" + $vnumber + "xs" 
    $setpass = ($gap + $height) + (($height + $gap) * ($vnumber -1))
    Set-Variable -name $varpass -Value $setpass

    $var1pass = "linevert" + $vnumber + "ys" 
    Set-Variable -name $var1pass -Value 10
    
    $var2pass = "linevert" + $vnumber + "xe" 
    $set2pass = ($gap + $height) + (($height + $gap) * ($vnumber -1))
    Set-Variable -name $var2pass -Value $set2pass
    
    $var3pass = "linevert" + $vnumber + "ye" 
    Set-Variable -name $var3pass -Value 50
    
    $ScrabbleGraphics.DrawLine($ScrabblePen, (Get-Variable -name ("linevert" + $vnumber + "xs") -ValueOnly), (Get-Variable -name ("linevert" + $vnumber + "ys") -ValueOnly), (Get-Variable -name ("linevert" + $vnumber + "xe") -ValueOnly), (Get-Variable -name ("linevert" + $vnumber + "ye") -ValueOnly))
}

foreach ($hnumber in 1..7){
    $hozpass = "linehoz" + $hnumber + "xs" 
    $valpass = $gap + (($height + $gap) * ($hnumber -1))
    Set-Variable -name $hozpass -Value $valpass

    $hoz1pass = "linehoz" + $hnumber + "ys" 
    Set-Variable -name $hoz1pass -Value 50
 
    $hoz2pass = "linehoz" + $hnumber + "xe" 
    $val2pass = ($gap + $height) + (($height + $gap) * ($hnumber -1))
    Set-Variable -name $hoz2pass -Value $val2pass

    $hoz3pass = "linehoz" + $hnumber + "ye" 
    Set-Variable -name $hoz3pass -Value 50

    $ScrabbleGraphics.DrawLine($ScrabblePen, (Get-Variable -name ("linehoz" + $hnumber + "xs") -ValueOnly), (Get-Variable -name ("linehoz" + $hnumber + "ys") -ValueOnly), (Get-Variable -name ("linehoz" + $hnumber + "xe") -ValueOnly), (Get-Variable -name ("linehoz" + $hnumber + "ye") -ValueOnly))
}

}
)
$lbldisplay = New-Object System.Windows.Forms.Label
$lbldisplay2 = New-Object System.Windows.Forms.Label
#$counter = 0
#While($counter -ne 13){
#    Foreach($Strhash in $HowManyLeft){
#        $lbldisplay.Text += $Strhash + [Environment]::NewLine
#        $counter++
#    }
#}
#While($counter -ne 27){
#    Foreach($Strhash in $HowManyLeft){
#        $lbldisplay2.Text += $Strhash + “`r`n”
#        $counter++
#    }
#}
$lbldisplay.Location = New-Object System.Drawing.Size(10,70)
$lbldisplay.Size = New-Object System.Drawing.Size(100,200)
$lbldisplay.BorderStyle = ([System.Windows.Forms.BorderStyle]::Fixed3D)
$lbldisplay2.Location = New-Object System.Drawing.Size(110,70)
$lbldisplay2.Size = New-Object System.Drawing.Size(100,200)
$lbldisplay2.BorderStyle = ([System.Windows.Forms.BorderStyle]::Fixed3D)
$ScrabbleForm.Controls.Add($lbldisplay)
$ScrabbleForm.Controls.Add($lbldisplay2)

$nextrndbutton = New-Object System.Windows.Forms.Button
$nextrndbutton.Add_Click({NextRndUser})
$nextrndbutton.Text = "Next Tiles"
$nextrndbutton.Location = New-Object System.Drawing.Size(200,270)
$nextrndbutton.AutoSize = $true
$ScrabbleForm.Controls.Add($nextrndbutton)

Function NextRndUser{
    #$UsedTiles = Read-Host "How Many Tiles has been Used?"
    $NeededTiles = 7
    $TileExists = $false
    $ScrabbleBagTiles = @(94) + 65..90
    Foreach($Scrabble in 1..$NeededTiles){
    While($TileExists -eq $false){
           $GrabATile = RandomLetter $ScrabbleBagTiles
           $TileExists = IsLetterInBag $GrabATile
    }
           $RackCharacterCovert = [Char]$GrabATile
        $ScrabbleRack += "$RackCharacterCovert"
        $TileExists = $false
    }
    ForEach ($newnumber in 1..7){
    $newvarName = "lbltile" + $newnumber
    $newobject = Get-Variable -Name $newvarName -ValueOnly
    $newobject.text = $ScrabbleRack[($newnumber - 1)]
    }
    $HowManyLeft =@()
    # Display the Information
    Foreach($Tile in $ScrabbleBagTiles){
           $ConvertToLetter = [Char]$Tile
           $HowManyLeft += ((Get-Variable $ConvertToLetter).Name+" = "+(Get-Variable $ConvertToLetter -ValueOnly).HowMany)
    }
}

Write-Output $ScrabbleRack
Write-Output $HowManyLeft

$ScrabbleForm.ShowDialog()