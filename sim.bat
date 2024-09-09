@Echo Off&Setlocal Enabledelayedexpansion
dir /s /b *.v >>a.txt
For /f "usebackq tokens=*" %%i in (".\a.txt") do (
Set "i=%%~i"&Set "i=!i:\=/!"
Echo.!i! >>".\list.f"
)
vsim -do make.tcl
Pause




