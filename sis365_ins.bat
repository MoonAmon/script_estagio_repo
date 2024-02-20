@echo off
mkdir c:\gcomweb 

echo.
echo Digite a quantidade de nodes:
set /p qnt_nodes=

echo.
echo Digite o disco de instalacao:
set /p caminho_ins=

:menu
cls
echo.
echo 1 - Baixar JDK
echo 2 - Baixar Tomcat
echo 3 - Baixar PostgreSQL
echo 4 - Criar pastas
echo 5 - Instalação Tomcat
echo 6 - Instalação PostgreSQL
echo 7 - Sair
echo 0 - test xml
echo.

set /p opcao=Escolha uma opcao e pressione ENTER:

if %opcao%==1 goto baixar_jdk
if %opcao%==2 goto baixar_tomcat
if %opcao%==3 goto baixar_postgresql
if %opcao%==4 goto criar_pastas
if %opcao%==5 goto instalacao_tomcat
if %opcao%==6 goto instalacao_postgresql
if %opcao%==7 goto sair
if %opcao%==0 goto xml_edit
goto menu

:baixar_jdk
curl -o c:\gcomweb\jdk-8.exe :: link
goto menu

:baixar_tomcat
goto menu

:baixar_postgresql
curl -o c:\gcomweb\postgresql-9.2.1-1-windows-x64.exe :: link
goto menu

:criar_pastas

echo Baixando WinRAR...
curl -o c:\gcomweb\winrar.exe https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-624br.exe

echo Instalação winRAR em andamento...
start /wait c:\gcomweb\winrar.exe /s

curl -o c:\gcomweb\htdocs.rar :: link
 "c:\Arquivos de Programas\WinRAR\WinRAR.exe" x -ibck c:\gcomweb\htdocs.rar %caminho_ins%:\

FOR /L %%i IN (1,1,%qnt_nodes%) DO (
    echo Criando pasta node%%i.tecff.com.br
    mkdir %caminho_ins%:\htdocs\node%%i.tecff.com.br
)

goto menu

:instalacao_jdk
start /wait c:\gcomweb\jdk-8.exe /s
goto menu

:instalacao_tomcat

echo Baixando Tomcat 8.5.3...
curl -o c:\gcomweb\tomcat-8.exe :: link


FOR /L %%i IN (1,1,%qnt_nodes%) DO (
    setlocal enabledelayedexpansion
    echo Instalação do node%%i...

    set caminho_tomcat=!caminho_ins!:\instances\Node%%i

    start /wait c:\gcomweb\tomcat-8.exe /S /D=!caminho_tomcat!
    echo instalacao !caminho_tomcat! concluida.

    echo Criando variaveis...
        set SERVER_PORT=700%%i
        set AJP_PORT=800%%i
        set HTTP_PORT=900%%i
        set SERVICE_NAME=Tomcat8node%%i
        set SERVICE_MANAGER=Tomcat8node%%i

        powershell -Command "(Get-Content '!caminho_tomcat!\conf\server.xml') -replace 'port=\"\d+\" shutdown=\"SHUTDOWN\"', 'port=\"%SERVER_PORT%\" shutdown=\"SHUTDOWN\"' | Set-Content '!caminho_tomcat!\conf\server.xml'"
        powershell -Command "(Get-Content '!caminho_tomcat!\conf\server.xml') -replace 'port=\"\d+\" protocol=\"AJP/1.3\" port=\"%AJP_PORT%\"', 'protocol=\"AJP/1.3\"' | Set-Content '!caminho_tomcat!\conf\server.xml'"
        powershell -Command "(Get-Content '!caminho_tomcat!\conf\server.xml') -replace 'port=\"\d+\" protocol=\"HTTP/1.1\"', 'port=\"%HTTP_PORT%\" protocol=\"HTTP/1.1\"' | Set-Content '!caminho_tomcat!\conf\server.xml'"

        powershell -Command "(Get-Content '!caminho_tomcat!\bin\service.bat') -replace 'set SERVICE_NAME=.*', 'set SERVICE_NAME=%SERVICE_NAME%' | Set-Content '!caminho_tomcat!\bin\service.bat'"
        powershell -Command "(Get-Content '!caminho_tomcat!\bin\service.bat') -replace 'set DISPLAYNAME=.*', 'set DISPLAYNAME=Apache Tomcat 8.5 %SERVICE_NAME%' | Set-Content '!caminho_tomcat!\bin\service.bat'"
        powershell -Command "(Get-Content '!caminho_tomcat!\bin\service.bat') -replace 'set SERVICE_MANAGER=.*', 'set SERVICE_MANAGER=%SERVICE_MANAGER%' | Set-Content '!caminho_tomcat!\bin\service.bat'"

    echo Instalacao do Tomcat node%%i concluida.

endlocal
)
goto menu

:instalacao_postgresql
start /wait c:\gcomweb\postgresql-9.2.1-1-windows-x64.exe --mode unattended --superpassword 123456 --serverport 5434
goto menu


:xml_edit
goto menu

:sair
exit