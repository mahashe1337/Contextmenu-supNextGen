param(
    [Parameter(Mandatory=$true)]
    [string]$newPath
)

# Get the current PATH environment variable
$currentPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
$currentPath = [System.Environment]::GetEnvironmentVariable("PATH", "User")

# Check if the new directory already exists in the PATH
if ($currentPath -notlike "*$newPath*") {
    # Add the new directory to the PATH
    $newPath = $currentPath + ";" + "$newPath"
    [System.Environment]::SetEnvironmentVariable("PATH", "$newPath", "Machine")
    [System.Environment]::SetEnvironmentVariable("PATH", "$newPath", "User")
    Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Папка добавлена в Path.','Mahashe Context Menu') > $null
} else {
    Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Папка уже в Path.','Mahashe Context Menu') > $null
}
