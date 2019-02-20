
function global:Invoke-Phoenix {
    <#
    .SYNOPSIS
        Control the VirtualBox setup and Docker container for the phoenix project.
    .DESCRIPTION
        Allows easy starting/stoping of either the docker container or VirtualBox machine,
        reporting the status of the virtual machine, and ssh access into either the docker container or virtual machine.
    .EXAMPLE
        Invoke-Phoenix start
    .PARAMETER Action
        The action to take.
    #>
    [CmdletBinding(ConfirmImpact = 'Low')]
    [Alias('Phnx')]
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $Action='start',

        [Parameter()]
        [Alias('D')]
        [switch] $Docker,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [Alias('Args')]
        [string] $SshArgs
    )

    process {
        if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
            Write-Output "This script needs to be run As Admin"
            return
        }

        if ($Action -ieq 'help') {
            Write-Output "help"
        } elseif ($Action -ieq 'start') {
            Write-Output "start"

            if ($Docker) {
                Write-Output "docker!"
            }
        } elseif ($Action -ieq 'ssh') {
            Write-Output "ssh"

            if ($Docker) {
                Write-Output "docker!"
            }

            if ($SshArgs.Length -gt 0) {
                Write-Output $SshArgs
            }
        }
    }
}

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
    [CmdletBinding(ConfirmImpact = 'Low')]
    [Alias('Touch')]
    param (
        [Parameter(Mandatory, HelpMessage = 'Enter a file name OR an array/list of file names.')]
        [ValidateNotNullOrEmpty()]
        [string[]] $File
    )

    process {
        foreach ($f in $File) {
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

function global:Switch-HyperV {
    <#
    .SYNOPSIS
        Change Hyper-V status.
    .DESCRIPTION
        Handles enabling and disabling Hyper-V.
    .EXAMPLE
        Switch-HyperV on
    .PARAMETER state
        State to set Hyper-V to. (enable|disable)
    #>
    [CmdletBinding(ConfirmImpact = 'Medium')]
    [Alias('hyperv')]
    param (
        [Parameter(HelpMessage='Enter either "enable" or "disable"')]
        [ValidateSet('enable', 'disable')]
        [string] $State
    )

    process {
        $currentState = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All | Select-Object -ExpandProperty State

        if ($State -eq '') {
            Write-Output "Hyper-V is currently $($currentState)"
            return
        }

        if ("$($State)d" -ieq $currentState) {
            Write-Output 'Hyper-V is already set to the desired state'
            return
        }

        if ($State -ieq 'enable') {
            Enable-WindowsOptionalFeature -FeatureName HypervisorPlatform -Online -NoRestart -WarningAction SilentlyContinue | Out-Null
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V-All -Online -NoRestart -WarningAction SilentlyContinue | Out-Null
        } else {
            Disable-WindowsOptionalFeature -FeatureName HypervisorPlatform -Online -NoRestart -WarningAction SilentlyContinue | Out-Null
            Disable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V-All -Online -NoRestart -WarningAction SilentlyContinue | Out-Null
        }

        Restart-Computer -Confirm
    }
}

function global:ccode {
    Set-Location -Path 'C:\Code'
}

function global:cmderr {
    Set-Location -Path 'C:\cmder'
}
