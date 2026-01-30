$dominio = "DC=EMPRESA,DC=LOCAL"
$passSegura = ConvertTo-SecureString "aso2025." -AsPlainText -Force

New-ADOrganizationalUnit -Name "Empresa" -Path $dominio

$departamentos = Import-Csv -Path C:\Users\Administrador\departamentos.csv -Delimiter ";"

foreach ($dept in $departamentos) {
    $nombreDept = $dept.departamento
    $rutaOUDept = "OU=$nombreDept,OU=Empresa,$dominio"

    New-ADOrganizationalUnit -Name $nombreDept -Path "OU=Empresa,$dominio" -Description $dept.descripcion

    New-ADGroup -Name $nombreDept -GroupCategory Security -GroupScope Global -Path $rutaOUDept
}

$empleados = Import-Csv -Path C:\Users\Administrador\empleados.csv -Delimiter ";"

foreach ($emp in $empleados) {
    $login = ($emp.nombre + "." + $emp.apellido).Replace(" ", "").ToLower()
    $nombreCompleto = "$($emp.nombre) $($emp.apellido)"
    $rutaUsuario = "OU=$($emp.departamento),OU=Empresa,$dominio"

    New-ADUser -Name $nombreCompleto `
               -SamAccountName $login `
               -Path $rutaUsuario `
               -AccountPassword $passSegura `
               -ChangePasswordAtLogon $true `
               -Enabled $true

    Add-ADGroupMember -Identity $emp.departamento -Members $login
}