$numero = [int](Read-Host "Introduce un  entero positivo")

if ($numero -gt 0) {
    $impares = @()
    
    for ($i = 1; $i -le $numero; $i++) {
        if ($i % 2 -ne 0) {  # Si es impar
            $impares += $i
        }
    }
    
    $resultado = $impares -join ", "
    Write-Host "Impares desde 1 hasta $numero`:"
    Write-Host $resultado
} else {
    Write-Host "Introduce un entero positivo."
}