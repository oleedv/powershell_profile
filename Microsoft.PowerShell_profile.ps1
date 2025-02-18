Set-location "$env:USERPROFILE\Azure"
Set-PSReadLineOption -PredictionViewStyle ListView
# Import-Module posh-git
# [Console]::OutputEncoding = [Text.Encoding]::UTF8
oh-my-posh init pwsh --config "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes\stelbent-compact.minimal.omp.json" | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })
Get-date
Write-host $env:COMPUTERNAME -ForegroundColor Yellow

function codemode {

  $gitrepo = git rev-parse --is-inside-work-tree

  if($gitrepo){
    Write-host "Running git branch" -ForegroundColor Yellow
    git branch
    Write-host "Running git pull" -ForegroundColor Yellow
    git pull
    Write-host "Opening Visual studio code.." -ForegroundColor Yellow
    code .
  } else {
    Write-host "Directory is not a git repo" -ForegroundColor Red
    Write-host "Opening Visual studio code.." -ForegroundColor Yellow
    code .
  }
}
