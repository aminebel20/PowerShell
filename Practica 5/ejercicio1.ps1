function Sumar($x, $y) { $x + $y }
function Restar($x, $y) { $x - $y }
function Multiplicar($x, $y) { $x * $y }
function Dividir($x, $y) { if ($y -ne 0) { $x / $y } else { "Error. No se puede dividir entre 0" } }

do {
    Clear-Host
    Write-Host "CALCULADORA"
    Write-Host "1. Sumar"
    Write-Host "2. Restar" 
    Write-Host "3. Multiplicar"
    Write-Host "4. Dividir"
    Write-Host "5. Salir"
    
    $op = Read-Host "Opcion"
    if ($op -eq "5") {
        Write-Host "Saliendo..."
        break
    }
    $a = [double](Read-Host "Numero 1")
    $b = [double](Read-Host "Numero 2")
        
    switch ($op) {
        "1" { $r = Sumar $a $b; Write-Host "$a + $b = $r" }
        "2" { $r = Restar $a $b; Write-Host "$a - $b = $r" }
        "3" { $r = Multiplicar $a $b; Write-Host "$a x $b = $r" }
        "4" { $r = Dividir $a $b; Write-Host "$a ÷ $b = $r" }
    }
        Read-Host "Enter para continuar"
    } while ($op -ne "5")