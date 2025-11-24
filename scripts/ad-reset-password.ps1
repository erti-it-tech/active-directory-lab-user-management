# Script : ad-reset-password.ps1
# Objectif : réinitialiser le mot de passe d'un utilisateur AD

Param(
    [Parameter(Mandatory = $true)]
    [string]$SamAccountName,

    [Parameter(Mandatory = $true)]
    [string]$NewPassword
)

Import-Module ActiveDirectory

Write-Host "Réinitialisation du mot de passe pour l'utilisateur : $SamAccountName"

$securePwd = $NewPassword | ConvertTo-SecureString -AsPlainText -Force

Set-ADAccountPassword -Identity $SamAccountName -NewPassword $securePwd -Reset
Set-ADUser -Identity $SamAccountName -ChangePasswordAtLogon $true

Write-Host "Mot de passe réinitialisé. L'utilisateur devra le changer à la prochaine connexion."
