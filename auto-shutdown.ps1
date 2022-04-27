function Get-RandomChar {
    $num=Get-Random -Minimum 65 -Maximum 90
    $letter=[char]$num
    return $letter
}

function Get-UserInput {
    $rand=Get-RandomChar
    $choice=Read-Host Please press the $rand key to prevent shutdown in 2 minutes...

    if ($choice.equals($rand)) {
        Write-Output Computer is shutting down...
        Timeout /T 10 /NOBREAK | Out-Null
        Shutdown /s /hybrid /t 0
    } else {
        Write-EventLog -LogName Application -Source AutoShutdown -EntryType Information -EventId 1 -Message 'Resetting auto shutdown timer'
    }
}

Timeout /T 7200 /NOBREAK | Out-Null
Get-UserInput