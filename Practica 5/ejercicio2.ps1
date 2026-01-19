function Mostrar-UsuariosCSV {
    $archivo = Read-Host "Nombre del archivo CSV"
    
    if (Test-Path $archivo) {
        $usuarios = Import-Csv $archivo
        
        foreach ($u in $usuarios) {
            Write-Host "$($u.Nombre) $($u.Apellidos) ($($u.Grupo))"
        }
    } else {
        Write-Host "Archivo no encontrado"
    }
}

Mostrar-UsuariosCSV