@echo off

SET qnt_nodes=%1
SET caminho_ins=%2

mkdir C:\GCOMWEB

FOR /L %%i IN (1,1,%qnt_nodes%) DO (
    echo Criando pasta node%%i.tecff.com.br
    mkdir %caminho_ins%:\htdocs\node%%i.tecff.com.br
)

pause