$rutaRaizUsers = "C:\Empresa_users"
$csvEmpleados = "C:\Users\Administrador\empleados.csv"
$dominioNETBIOS = "EMPRESA"
$servidor = "Empresa-dc1"
$rutaNetlogon = "C:\Windows\SYSVOL\sysvol\EMPRESA.LOCAL\scripts"

if (!(Test-Path $rutaRaizUsers)) {
    New-Item -Path $rutaRaizUsers -ItemType Directory
}
New-SmbShare -Name "Empresa_users$" -Path $rutaRaizUsers -FullAccess "Usuarios del Dominio"

$contenidoBat = "powershell New-SmbMapping -LocalPath 'Y:' -RemotePath '\\$servidor\Empresa'"
$rutaArchivoBat = Join-Path $rutaNetlogon "carpetas.bat"
Set-Content -Path $rutaArchivoBat -Value $contenidoBat 

$empleados = Import-Csv -Path $csvEmpleados -Delimiter ";" 

foreach ($emp in $empleados) {
    $login = ($emp.nombre + "." + $emp.apellido).Replace(" ", "").ToLower()
    $rutaCarpetaPersonal = Join-Path $rutaRaizUsers $login
    $usuarioAD = "$dominioNETBIOS\$login"

    if (!(Test-Path $rutaCarpetaPersonal)) {
        New-Item -Path $rutaCarpetaPersonal -ItemType Directory
    }

    $acl = Get-Acl $rutaCarpetaPersonal
    $acl.SetAccessRuleProtection($true, $false) 
    
    $reglaPropietario = New-Object System.Security.AccessControl.FileSystemAccessRule($usuarioAD, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($reglaPropietario)
    
    $reglaAdmin = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
    $acl.AddAccessRule($reglaAdmin)

    Set-Acl -Path $rutaCarpetaPersonal -AclObject $acl

    Set-ADUser -Identity $login `
               -HomeDrive "Z:" `
               -HomeDirectory "\\$servidor\Empresa_users$\$login" `
               -ScriptPath "carpetas.bat" 
}