cd "C:\Users\%username%\Google Drive"

mkdir ComputerData

robocopy C:/Users/%username%/Documents/ "C:/Users/%username%/Google Drive/ComputerData/"  /xd C:\Users\%username%\Documents\IBM /MIR /R:0 /W:0