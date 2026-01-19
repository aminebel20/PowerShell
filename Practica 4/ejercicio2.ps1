$edad = [int](Read-Host "Cuantos años tienes?")

Write-Host "Has cumplido los siguientes años:"
for ($año = 1; $año -le $edad; $año++) {
    Write-Host $año
}