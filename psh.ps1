function psh() {
    # Process for Github - push
    Write-Host "Enter Message :"
    $mssg = Read-Host
    $dt = Get-Date
    Write-Host $dt
    if ($mssg.Length -eq 0) {
        Write-Host "message cannot be empty"
    } else {
        git add .
        git commit -m "${mssg} | $dt"
        git push
        Write-Host "Pushed to Repository :)"
    }
}

psh