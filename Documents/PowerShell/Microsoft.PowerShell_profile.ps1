Function touch {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$fileName
    )

    echo $null >> $fileName
}

