# Helper functions
Function touch {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$fileName
    )

    echo $null >> $fileName
}

# Environment variables
# Locations
$CHEZMOI_DIR = "$HOME/.local/share/chezmoi"

# Default editor
$ENV:EDITOR = 'vim'

# Prompt
Invoke-Expression (&starship init powershell)
