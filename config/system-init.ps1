# cmder git location
$gitPath = 'C:\cmder\vendor\git-for-windows\cmd'
# Get System Path variable
$path = [System.Environment]::GetEnvironmentVariable('PATH', 'Machine')
# Attempt to remove the git path if it already exists
$path = ($path.Split(';') | Where-Object {$_ -ne $gitPath}) -join ';'
# Append the git path to the System
[System.Environment]::SetEnvironmentVariable('PATH', $path + $gitPath + ';', 'Machine')
