$numero = [int](Read-Host "Introduce un número: ")

Write-Host "`nTabla de multiplicar del $numero`:" 

for ($i = 1; $i -le 10; $i++) {
    $resultado = $numero * $i
    Write-Host "$numero x $i = $resultado"
}