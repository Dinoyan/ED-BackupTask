# $list = import-csv "C:\Users\ganeshd\Desktop\coop-list.csv"

$complist = "WSHR2Q433", "WSHR2Q423"

ForEach ($computer in $complist) {
 if (Test-Connection -ComputerName "$computer" -Quiet -Count 1) {
    Set-Content \\$computer\C$\test.bat 'cd "C:\Users\%username%\Google Drive"

    mkdir ComputerData

    robocopy C:/Users/%username%/Documents/ "C:/Users/%username%/Google Drive/ComputerData/"  /xd C:\Users\%username%\Documents\IBM /MIR /R:0 /W:0'

    SCHTASKS /Create /S $computer /TN GBackupTask /TR "C:\taskTest.bat" /SC ONLOGON /RU SYSTEM

    Write-Host "Task created on $computer" -ForegroundColor Green
 } else {
    Write-Host "$computer is not online" -ForegroundColor Red
 }
}

CMD /c PAUSE