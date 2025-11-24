# Script : ad-create-test-users.ps1
# Objectif : créer quelques utilisateurs de test dans l'OU LAB_Users

Import-Module ActiveDirectory

# OU cible
$ouPath = "OU=LAB_Users,DC=lab,DC=local"

# Liste d'utilisateurs à créer
$users = @(
    @{ GivenName = "User"; Surname = "One"; SamAccountName = "user1" },
    @{ GivenName = "User"; Surname = "Two"; SamAccountName = "user2" },
    @{ GivenName = "Helpdesk"; Surname = "One"; SamAccountName = "helpdesk1" }
)

foreach ($u in $users) {
    $name = "$($u.GivenName) $($u.Surname)"
    $sam = $u.SamAccountName
    $upn = "$sam@lab.local"
    $password = "P@ssw0rd123" | ConvertTo-SecureString -AsPlainText -Force

    Write-Host "Création de l'utilisateur : $name ($sam)"

    New-ADUser `
        -Name $name `
        -GivenName $u.GivenName `
        -Surname $u.Surname `
        -SamAccountName $sam `
        -UserPrincipalName $upn `
        -Path $ouPath `
        -AccountPassword $password `
        -Enabled $true `
        -ChangePasswordAtLogon $true
}
