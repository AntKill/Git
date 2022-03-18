pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Containers*.mum >sandbox.txt
for /f %%i in ('findstr /i . sandbox.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del sandbox.txt
Dism /online /enable-feature /featurename:Containers-DisposableClientVM /LimitAccess /ALL
pause