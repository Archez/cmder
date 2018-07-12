function global:Invoke-Touch {
    <#
    .SYNOPSIS
    Change file timestamps.
    .DESCRIPTION
    Update the access and modifcation times of each FILE to the current time.
    A FILE argument that does not exist is created empty.
    .EXAMPLE
    Touch-File example.txt
    .PARAMETER File
    The name of the file to touch.
    #>
    [CmdletBinding(ConfirmImpact='Low')]
    [Alias('Touch')]
    param (
        [Parameter(Mandatory, HelpMessage='Enter a file name OR an array/list of file names.')]
        [ValidateNotNullOrEmpty()]
        [string[]] $File
    )

    process {
        foreach($f in $File) {
            if (Test-Path $f) {
                Write-Verbose "Updating $f"
                Set-ItemProperty -Path $f -Name LastWriteTime -Value (Get-Date)
            } else {
                Write-Verbose "Creating $f"
                New-Item -Path $f -ItemType File | Out-Null
            }
        }
    }
}

function global:ccode {
    Set-Location -Path 'C:\Code'
}
