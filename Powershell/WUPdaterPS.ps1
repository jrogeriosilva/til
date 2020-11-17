If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  echo Elevando Previlegios
  Start-Process powershell.exe "-File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
  exit
}

# Parametros para o agendador de tarefas.
# PowerShell.exe
# -windowstyle hidden C:\Scripts\Automated_Windows_Updates.ps1

# O Script automaticamente instala atualiza��es do windows update
Function InstallWindowsModules
{
    # Instala o NuGet
    Install-PackageProvider -Name NuGet -Force

    # Confia na Microsofts PSGallery
    Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
    
    # Instala o m�dulo PSWindowsUpdate
    Install-Module PSWindowsUpdate

    # Define o arquivo de progresso para 1, para indicar que os m�dulos etc. est�o instalados.
    Set-Content C:\AutoUpdates\Progress.txt -Value 1

}

Function InstallWindowsUpdates
{
    # Obt�m as atualiza��es mais recentes do Windows
    Get-WindowsUpdate | Out-File C:\AutoUpdates\History\Updates_"$((Get-Date).ToString('dd-MM-yyyy_HH.mm.ss'))".txt

    #Instala atualiza��es, aceita todas automaticamente e reinicia.
    Install-WindowsUpdate -Install -AcceptAll -AutoReboot

}


# Verifica se a pasta "AutoUpdates j� existe na m�quina . Caso contr�rio, ele a cria.."
$ChkPath = "C:\AutoUpdates"
$PathExists = Test-Path $ChkPath
If ($PathExists -eq $false)
{
    mkdir C:\AutoUpdates
    mkdir C:\AutoUpdates\History
}
else
{
}


$ChkFile = "C:\AutoUpdates\Progress.txt"
$FileExists = Test-Path $ChkFile
If ($FileExists -eq $false)
{
    New-Item C:\AutoUpdates\Progress.txt
    Set-Content C:\AutoUpdates\Progress.txt -Value 0
}
else
{
}



# Verifica se os modulos j� foram instalados, procurando por 0.
$Status = Get-Content C:\AutoUpdates\Progress.txt -First 1

If ($Status -eq 0) 
{
    InstallWindowsModules
    InstallWindowsUpdates
}
elseif ($Status -eq 1)
{
    InstallWindowsUpdates
}
