$contrasenaCorrecta = "secreto123"
do {
    $contrasenaUsuario = Read-Host "Introduce la contraseña"
    
    if ($contrasenaUsuario -eq $contrasenaCorrecta) {
        Write-Host "Contraseña correcta" 
        break
    }
    else {
        Write-Host "Contraseña incorrecta. Intenta de nuevo." 
    }
    
} while ($true)
