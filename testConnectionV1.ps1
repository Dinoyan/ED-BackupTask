$list = import-csv "C:\Users\ganeshd\Desktop\coop-list.csv"

$complist = "WSHR2Q433", "WSHR2Q433"

ForEach ($computer in $complist) {
 if (Test-Connection -ComputerName "$computer" -Quiet -Count 1) {
    Set-Content \\$computer\C$\test.bat 'cd "C:\Users\%username%\Google Drive"

    mkdir ComputerData

    robocopy C:/Users/%username%/Documents/ "C:/Users/%username%/Google Drive/ComputerData/"  /xd C:\Users\%username%\Documents\IBM /MIR /R:0 /W:0'

    SCHTASKS /Create /S $computer /TN GBackupTask /TR "C:\test.bat" /SC ONLOGON /RU SYSTEM

 }
}