New-Item -Path "C:\Empresa" -ItemType Directory -Force

Import-Csv -Path "C:\Users\Administrador\departamentos.csv" -Delimiter ";" | ForEach-Object {
    New-Item -Path ("C:\Empresa\" + $_.departamento) -ItemType Directory -Force
}

(Get-Acl -Path "C:\Empresa") | ForEach-Object {
    $_.SetAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule("Usuarios del Dominio", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")))
    Set-Acl -Path "C:\Empresa" -AclObject $_
}

Import-Csv -Path "C:\Users\Administrador\departamentos.csv" -Delimiter ";" | ForEach-Object {
    (Get-Acl -Path ("C:\Empresa\" + $_.departamento)) | ForEach-Object {
        $_.SetAccessRuleProtection($true, $false)
        $_.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule(("EMPRESA\" + $args), "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")))
        $_.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")))
        $_.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule("Usuarios del Dominio", "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")))
        Set-Acl -Path ("C:\Empresa\" + $args) -AclObject $_
    } -ArgumentList $_.departamento
}
