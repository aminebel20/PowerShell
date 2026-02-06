$usuariosPersonal = Get-ADGroupMember -Identity "PERSONAL" | Where-Object { $_.objectClass -eq 'user' }

foreach ($u in $usuariosPersonal) {
    $login = $u.SamAccountName
    Set-ADUser -Identity $login -ProfilePath "\\Empresa-dc1\Empresa_users$\$login\"
}
