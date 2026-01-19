$altura = [int](Read-Host "Introduce la altura del triángulo")

for ($fila = 1; $fila -le $altura; $fila++) {
    $numeroImpar = (2 * $fila) - 1
    
    for ($j = $numeroImpar; $j -ge 1; $j -= 2) {
        Write-Host "$j " -NoNewline
    }
    Write-Host "" 
}