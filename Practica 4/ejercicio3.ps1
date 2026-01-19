$numero = [int](Read-Host "Introduce un  entero positivo")

if ($numero -gt 0) {
    $cuenta_atras = @()
    
    for ($i = $numero; $i -ge 0; $i--) {
        $cuenta_atras += $i
    }
    
    $resultado = $cuenta_atras -join ", "
    Write-Host $resultado
} else {
    Write-Host "Introduce un  entero positivo."
}