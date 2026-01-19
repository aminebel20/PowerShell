function Mostrar-Menu {
    Clear-Host
    Write-Host "=== MENÚ DE OPERACIONES DE ARCHIVOS ==="
    Write-Host "a) Crear una carpeta"
    Write-Host "b) Crear un fichero nuevo"
    Write-Host "c) Cambiar el nombre de un fichero o carpeta"
    Write-Host "d) Borrar un archivo o carpeta"
    Write-Host "e) Verificar si existe un fichero o carpeta"
    Write-Host "f) Mostrar el contenido de un directorio"
    Write-Host "g) Mostrar la fecha y hora actuales"
    Write-Host "x) Salir"
    Write-Host "======================================="
}

function Crear-Carpeta {
    $nombreCarpeta = Read-Host "Introduce el nombre de la carpeta a crear"
    $rutaCompleta = Join-Path (Get-Location) $nombreCarpeta
    
    if (-not (Test-Path $rutaCompleta)) {
        New-Item -Path $rutaCompleta -ItemType Directory | Out-Null
        Write-Host "Carpeta '$nombreCarpeta' creada"
    } 
    else {
        Write-Host "La carpeta '$nombreCarpeta' ya existe" 
    }
}

function Crear-Fichero {
    $nombreFichero = Read-Host "Introduce el nombre del fichero a crear (con extensión)"
    $rutaCompleta = Join-Path (Get-Location) $nombreFichero
    
    if (-not (Test-Path $rutaCompleta)) {
        New-Item -Path $rutaCompleta -ItemType File | Out-Null
        Write-Host "Fichero '$nombreFichero' creado"
    } 
    else {
        Write-Host "El fichero '$nombreFichero' ya existe." 
    }
}

function Cambiar-Nombre {
    $nombreActual = Read-Host "Introduce el nombre actual del fichero/carpeta"
    $nuevoNombre = Read-Host "Introduce el nuevo nombre"
    $rutaActual = Join-Path (Get-Location) $nombreActual
    $rutaNueva = Join-Path (Get-Location) $nuevoNombre
    
    if (Test-Path $rutaActual) {
        if (-not (Test-Path $rutaNueva)) {
            Rename-Item -Path $rutaActual -NewName $nuevoNombre
            Write-Host "Renombrado correctamente '$nuevoNombre'" 
        }
        else {
            Write-Host "Ya existe el nombre '$nuevoNombre'" 
        }
    }
    else {
        Write-Host "El elemento '$nombreActual' no existe" 
    }
}

function Borrar-Elemento {
    $nombre = Read-Host "Introduce el nombre del fichero/carpeta a borrar"
    $ruta = Join-Path (Get-Location) $nombre
    
    if (Test-Path $ruta) {
        Remove-Item -Path $ruta -Recurse -Force
        Write-Host "Elemento '$nombre' borrado" 
    }
    else {
        Write-Host "El elemento '$nombre' no existe" 
    }
}

function Verificar-Existencia {
    $nombre = Read-Host "Introduce el nombre del fichero/carpeta a verificar"
    $ruta = Join-Path (Get-Location) $nombre
    
    if (Test-Path $ruta) {
        Write-Host "El elemento '$nombre' SI existe"
    }
    else {
        Write-Host "El elemento '$nombre' NO existe" 
    }
}

function Mostrar-Contenido {
    $directorio = Read-Host "Introduce la ruta del directorio "

    if (Test-Path $directorio -PathType Container) {
        Get-ChildItem -Path $directorio -Directory 
        Get-ChildItem -Path $directorio -File 
    }
    else {
        Write-Host "La ruta '$directorio' no es  valida"
    }
}

function Mostrar-FechaHora {
    $fechaHora = Get-Date
    Write-Host "Fecha: $($fechaHora.ToString('dd/MM/yyyy'))"
    Write-Host "Hora: $($fechaHora.ToString('HH:mm:ss'))"
}

do {
    Mostrar-Menu
    $opcion = Read-Host "Selecciona una opción"
    
    switch ($opcion) {
        'a' { Crear-Carpeta }
        'b' { Crear-Fichero }
        'c' { Cambiar-Nombre }
        'd' { Borrar-Elemento }
        'e' { Verificar-Existencia }
        'f' { Mostrar-Contenido }
        'g' { Mostrar-FechaHora }
        'x' { 
            Write-Host "Saliendo..." 
            break 
        }
        default {
            Write-Host "Opción no válida. Intenta de nuevo." 
        }
    }
} while ($opcion -ne 'x')
