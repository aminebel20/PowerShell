$nombre = Read-Host "Introduce tu nombre"
$numero = [int](Read-Host "Introduce un número entero")

for ($i = 1; $i -le $numero; $i++) {
    Write-Host $nombre
}