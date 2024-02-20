@echo off
mkdir c:\GCOMWEB
set disco_instalacao=

echo.
echo Digite a quantidade de nodes:
set /p qnt_nodes=

echo.
echo Digite o disco de instalacao:
set /p disco_instalacao=

curl -o c:\gcomweb\jdk-8.exe :: link
curl -o c:\gcomweb\postgresql-9.2.1-1-windows-x64.exe :: link
curl -o c:\gcomweb\winrar.exe :: link
curl -o c:\gcomweb\htdocs.rar :: link

FOR \L %%i IN (1,1,%qnt_nodes%) DO (
    echo Criando pasta node%%i.tecff.com.br
    mkdir %disco_instalacao%:\htdocs\node%%i.tecff.com.br
)

echo Instalacao jdk em andamento...
start /wait c:\GCOMWEB\jdk-8.exe /s

echo Instalacao PostgreSQL em andamento...
start /wait c:\GCOMWEB\postgresql-9.2.1-1-windows-x64.exe --mode unattended --superpassword 123456 --serverport 5434

echo Extraindo base 365...
FOR \L %%i IN (1,1,%qnt_nodes%) DO (
  echo.
  echo Sistema para instalacao de node%%i 1-GCOMWEB 2-PDV:
  set /p sistema_temp=

  IF %sistema_temp%==1 (
        echo Extraindo base 365 para node%%i...
        "c:\Program Files\WinRAR\WinRAR.exe" x -ibck c:\GCOMWEB\365.zip %disco_instalacao%:\htdocs\node%%i.tecff.com.br
    ) ELSE (
        echo Extraindo base PDV para node%%i...
        "c:\Program Files\WinRAR\WinRAR.exe" x -ibck c:\GCOMWEB\pdv.zip %disco_instalacao%:\htdocs\node%%i.tecff.com.br
    )
)

echo.
echo Instalacao parcial concluida.
pause
