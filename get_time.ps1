$outputLines = net time \\10.0.0.10
$datePattern = "\d{2}/\d{2}/\d{4} \d?\d:\d{2}:\d{2}"


$extractedDateTime = $null

foreach ($line in $outputLines) {
    if ($line -match $datePattern) {
        $extractedDateTime = $matches[0]
        break
    }
}

if ($null -ne $extractedDateTime) {
    $newDateTime = Get-Date $extractedDateTime
    Set-Date $newDateTime
} else {
    Write-Error "Date and time pattern not found in the output"
}
