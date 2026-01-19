$altura = [int](Read-Host "Introduce la altura del triángulo")

for ($i = 1; $i -le $altura; $i++) {
    for ($j = 1; $j -le $i; $j++) {
        Write-Host "* " -NoNewline
    }
    Write-Host "" 
}