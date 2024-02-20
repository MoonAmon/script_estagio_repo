# Projeto de Instalação Automatizada SIS365

Olá a todos,

Gostaria de apresentar um projeto no qual estou trabalhando para automatizar a instalação de servidores, uma solução que simplifica a instalação e configuração de múltiplos nós. Atualmente, a instalação parcial está funcionando, mas já estou trabalhando para automatizar todo o processo (ou pelo menos a maior parte dos passos).

## Funcionalidades Atuais

1. **Instalação do Banco de Dados**: Instalação e configuração do banco de dados.
2. **Download Automático de Softwares**: Baixa automaticamente JDK 8, PostgreSQL e Tomcat, diretamente da base de suporte.
3. **Instalação Simples**: Instala e configura o sistema com algumas etapas simples.
4. **Configurações Personalizadas**: Personalize configurações como porta e senha do PostgreSQL (instalação inicial).

## Próximas Funcionalidades

1. **Instalação Automática com Configurações Personalizadas**: Configuração automática de acordo com o sistema operacional.
2. **Backup do Banco de Dados**: Carregar a base de dados do sistema no banco de dados.
3. **Instalação e Configuração do Tomcat (nós)**: Instalação e configuração do Tomcat com suas devidas portas e configuração do Java.
4. **Configuração do .conf do Banco de Dados**: Configuração dentro do arquivo .conf do banco de dados.

## Como Usar

1. Baixe o contexto .zip do sistema 365 e do PDV.
2. Renomeie os arquivos para `365.zip` e `PDV.zip`.
3. Cole os arquivos na pasta `gcomweb` no disco local principal.
4. Abra o prompt de comando.
5. Navegue até o diretório do script `sis365_ins_partial.bat`.
6. Execute o script e siga as instruções.

## Requisitos e Contribuições

- **Requisitos**: Compatível com sistemas Windows e requer acesso à internet.
- **Contribuições**: Envie suas sugestões e melhorias.
