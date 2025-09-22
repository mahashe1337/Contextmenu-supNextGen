param(
  [Parameter(Mandatory=$true)]
  [string]$PathToRemove
)

# === надёжное удаление пути из PATH (User и Machine), без падений ===

# Нормализация
try { $PathToRemove = [IO.Path]::GetFullPath($PathToRemove.Trim('"').Trim()) } catch {}
$PathToRemove = $PathToRemove.TrimEnd('\')

# Проверка админа (для Machine)
$IsAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

function Remove-FromPathScope {
  param([ValidateSet('User','Machine')]$Scope,[string]$Target,[switch]$RequireAdmin)

  if ($RequireAdmin -and -not $IsAdmin) { return 'Denied' }

  $cur = [Environment]::GetEnvironmentVariable('PATH', $Scope)
  if ([string]::IsNullOrWhiteSpace($cur)) { return 'NotFound' }

  $seg    = $cur -split ';' | Where-Object { $_ -ne '' }
  $kept   = New-Object System.Collections.Generic.List[string]
  $found  = $false

  foreach ($s in $seg) {
    $n = $s.Trim('"').Trim()
    try { $n = [IO.Path]::GetFullPath($n) } catch {}
    $n = $n.TrimEnd('\')
    if ($n -and ($n -ieq $Target)) { $found = $true; continue }
    $kept.Add($s)
  }

  if ($found) {
    $newPath = ($kept -join ';')
    try {
      [Environment]::SetEnvironmentVariable('PATH', $newPath, $Scope)
      return 'Removed'
    } catch {
      return 'Denied'
    }
  } else {
    return 'NotFound'
  }
}

# Выполнение
$resUser    = Remove-FromPathScope -Scope User    -Target $PathToRemove
$resMachine = Remove-FromPathScope -Scope Machine -Target $PathToRemove -RequireAdmin

# Сообщение без Add-Type (надёжно)
$ws = New-Object -ComObject WScript.Shell
function Pop($msg,$title='Mahashe Context Menu'){ $ws.Popup($msg,0,$title,64) | Out-Null }

switch -Regex ("$resUser|$resMachine") {
  'Removed' { 
    $sc = @()
    if ($resUser -eq 'Removed')    { $sc += 'User' }
    if ($resMachine -eq 'Removed') { $sc += 'System' }
    Pop "Удалено из PATH:`n$PathToRemove`nScopes: $($sc -join ', ')"
    break
  }
  'Denied' {
    $den = @()
    if ($resUser -eq 'Denied')    { $den += 'User' }
    if ($resMachine -eq 'Denied') { $den += 'System' }
    Pop "Нет прав на изменение PATH в: $($den -join ', ').`nЗапусти от администратора для System."
    break
  }
  default {
    Pop "Путь не найден в PATH:`n$PathToRemove"
  }
}
