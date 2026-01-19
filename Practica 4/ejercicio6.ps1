$numeroSecreto = Get-Random -Minimum 0 -Maximum 101
$intentos = 0
$adivinado = $false

do {
    $intento = [int](Read-Host "Introduce tu número")
    $intentos++
    
    if ($intento -lt $numeroSecreto) {
        Write-Host "El número es MAYOR " 
    }
    elseif ($intento -gt $numeroSecreto) {
        Write-Host "El número es MENOR " 
    }
    else {
        $adivinado = $true
        Write-Host "Has adivinado el número $numeroSecreto en $intentos intentos."
    }
    
} while (-not $adivinado)
