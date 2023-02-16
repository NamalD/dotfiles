# Aliases
del alias:cd -Force

New-Alias -Name cd -Value z
New-Alias -Name cz -Value chezmoi
New-Alias -Name k -Value kubectl
New-Alias -Name vi -Value nvim
New-Alias -Name which -Value get-command

# Key binds
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward

# Helper functions
## kubernetes contexts
function kdev {
    k config use-context dev
}

function kprod {
    k config use-context prod
}

function koldprod {
    k config use-context old-prod
}

## touch
Function touch {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$fileName
    )

    echo $null >> $fileName
}

# Environment variables
## Locations
$CHEZMOI_DIR = "$HOME/.local/share/chezmoi"

## Default editor
$env:EDITOR = 'nvim'

# Tools
## zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

# Prompt
Invoke-Expression (&starship init powershell)
