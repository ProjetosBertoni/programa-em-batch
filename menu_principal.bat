chcp 65001
@echo off
title Menu Principal
mode 80,40
echo.
:login
cls
echo.
echo ---------------------------------------------------------
echo 				Gerenciamento de Clientes
echo ---------------------------------------------------------
echo [N] Novo Cliente
echo [L] Listagem Geral de Clientes
echo [C] Consulta Individualizada de Clientes
echo [A] Adentrar na conta
echo [E] Encerrar Programa
echo ---------------------------------------------------------
set /p opc=Digite opção desejada: 
if /i %opc% equ n (goto:gravar)
if /i %opc% equ l (goto:listar)
if /i %opc% equ c (goto:consultar)
if /i %opc% equ a (goto:login2)
if /i %opc% equ e (exit) else (
	echo.
	echo Opção Inválida!
	echo.
	pause
	goto inicio)
	
:gravar
cls
echo.
set /p cpf=Digite o CPF do Cliente:
set /p nome=Digite o Nome do Cliente:
if not exist lista.txt (
	echo Lista Gerada com Sucesso! >> lista.txt)
	
:: > = inserção
	Findstr %cpf% lista.txt
::Errorlevel equ 0 se existir o cpf na lista
::Errorlevel equ 1 se não existir
	if %Errorlevel% == 1 (
		echo Data:%date% Hora:%time% CPF:%cpf% Nome:%nome% >> lista.txt
		echo.
		echo Cliente Cadastrado com Sucesso!
		echo.
		goto:pergunta) else (
		echo.
		cls
		echo Cliente já cadastrado!
		echo.
		pause
		goto:login)		
:pergunta
echo.
set /p resp=Deseja cadastrar novo cliente? [S/N] :
if /i %resp% equ s (goto:gravar) else (goto:inicio)

:listar
cls
echo.
echo ---------------------------------------------
echo 			Listagem Geral de Clentes
echo ---------------------------------------------
	type lista.txt
echo ---------------------------------------------
echo.
pause
goto login

:consultar
cls
echo.
set /p busca=Digite o CPF ou Nome do Cliente a ser pesquisado:
echo.
echo ---------------------------------------------
echo  CONSULTA INDIVIDUALIZADA DE CLIENTE
echo ---------------------------------------------
	 Findstr /i %busca% lista.txt
echo -----------------------------------------
echo.
set /p resp=Deseja realizar nova consulta? [S/N] :
if /i %resp% equ s (goto:consultar) else (goto:login)

:login2
cls
echo ---------------------------------------------------------
echo                          Login
echo ---------------------------------------------------------
set /p usuario=Digite o nome de usuário:

:: Verifica se o usuário existe no arquivo
findstr /i "%usuario%" lista.txt >nul
if %errorlevel%==0 (
    echo.
    echo Login bem-sucedido! Bem-vindo, %usuario%.
    echo.
    pause
    goto mp
) else (
    echo.
    echo Usuario não encontrado. Tente novamente!
    echo.
    pause
    goto login2
)
::--------------------------------------------------------------------------------------------------
:mp
cls
echo.
echo --------------------------------------------
echo Menu Principal
echo --------------------------------------------
echo PRESSIONE:
echo [P] pacote office
echo [A] aplicativos windows
echo [S] serviços de rede/diversos
echo [J] jogos
echo [G] gerenciamento da maquina
echo [E] encerra sessao
echo [F] Finalizar o programa

set /p op=digite uma opcao :
if /i %op% equ P (goto:pacote_office )
if /i %op% equ A (goto:aplicativos_windows)
if /i %op% equ S (goto:servicos_de_rede)
if /i %op% equ J (goto:jogos) 
if /i %op% equ G (call:gerenciamento_de_maquina)
if /i %op% equ E (goto:login)
if /i %op% equ F (exit) else (
	echo.
	echo Opção Inválida!
	echo.
	pause
	goto mp)
	
::----------------------------------------------------------------------------------------------------------------	

:pacote_office 
cls
echo.
echo ---------------------------------------------------
echo PACOTE OFFICE 
echo ---------------------------------------------------
echo [W] executar o word
echo [E] executar o excel
echo [P] executar o powerpoint
echo [A] executar o access
echo [R] retornar para o menu

set /p op=digite uma opcao: 
if /i %op% equ w (goto:word)
if /i %op% equ e (goto:excel)
if /i %op% equ p (goto:powerpoint)
if /i %op% equ a (goto:access)
if /i %op% equ r (goto:mp) else (
	echo.
	echo Opção Inválida!
	echo.
	pause
	goto mp)

:word 
start Winword.exe
goto pacote_office

:excel
start excel.exe 
goto pacote_office 

:powerpoint
start powerpnt.exe
goto pacote_office 
::POWERPNT.EXE

:access
start msaccess.exe
goto pacote_office 
::MSACCESS.EXE

::----------------------------------------------------------------------------------------------------------------------

:aplicativos_windows
cls 
echo. 
echo ------------------------------------
echo APLICATIVOS DO WINDOWS 
echo ------------------------------------
echo [B] bloco de notas
echo [T] teclado virtual 
echo [P] painel de controle 
echo [C] calculadora 
echo [W] windows explorer
echo [R] retorna ao menu 

set /p op=digite uma opcao: 
if /i %op% equ b (goto:bloco_notas)
if /i %op% equ t (goto:teclado_virtual)
if /i %op% equ p (goto:painel_controle)
if /i %op% equ c (goto:calculadora) 
if /i %op% equ w (goto:windows_explorer)
if /i %op% equ r (goto:mp) else (
	echo.
	echo Opção Inválida!
	echo.
	pause
	goto aplicativos_windows)

:bloco_notas
start notepad.exe 
goto aplicativos_windows

:teclado_virtual 
start osk.exe
goto aplicativos_windows

:painel_controle
start control.exe
goto aplicativos_windows

:calculadora
start calc.exe
goto aplicativos_windows

:windows_explorer
start explorer.exe
goto aplicativos_windows

::--------------------------------------------------------------------------------------------------------------------------------------

:servicos_de_rede
cls
echo.
echo ---------------------------------------------------------------------
echo SERVICOS DE REDE 
echo ---------------------------------------------------------------------
echo [N] navegar na web
echo [G] pesquisar algo no google
echo [Y] pesquisar algo no youtube
echo [T] teste de conexao 
echo [O] obter ip da maquina 
echo [R] retornar para o menu 

set /p op=digite uma opcao: 
if /i %op% equ n (goto:navegar_web)
if /i %op% equ g (goto:google)
if /i %op% equ y (goto:youtube)
if /i %op% equ t (goto:teste_conexao)
if /i %op% equ o (goto:obter_ip)
if /i %op% equ r (goto:mp) else (
	echo.
	echo Opção Inválida!
	echo.
	pause
	goto servicos_de_rede)

:navegar_web
echo.
start chrome.exe https://www.google.com
goto servicos_de_rede

:google
echo.
set /p busca=Digite o termo a ser pesquisado no Google: 
start chrome.exe https://www.google.com/search?q=%busca%
goto servicos_de_rede

:youtube
echo. 
set /p busca=digite o conteudo a ser pequisado: 
start chrome.exe https://www.youtube.com/results?search_query=%busca%
goto servicos_de_rede 

:teste_conexao
echo.
set /p conexao=digite o ip da maquina ou endereco web 
ping %conexao% -t 
goto servicos_de_rede 

:obter_ip
echo.
echo O IP da sua máquina é:
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do echo %%a
pause
goto servicos_de_rede

::--------------------------------------------------------------------------------------------------------------------------------------
:jogos 
cls 
echo. 
echo -----------------------------------------
echo JOGOS 
echo -----------------------------------------
echo PRESSIONE 
echo [1] adivinhar numeros 
echo [2] joken po
echo [R] retornar para o menu 

set /p op=digite um opcao: 
if %op% equ 1 (goto:adivinhar_numeros)
if %op% equ 2 (goto:jokenpo)
if /i %op% equ r (goto:mp) else (
	echo.
	echo Opção Inválida!
	echo.
	pause
	goto jogos)

:adivinhar_numeros
set /a tentativas=5
set /a min=0
set /a max=50

cls
echo ---------------------------------------
echo           JOGO DE ADIVINHAÇÃO
echo ---------------------------------------
echo O computador sorteou um número entre %min% e %max%.
echo Voce tem %tentativas% tentativas para acertar.
echo ---------------------------------------

rem Sorteia o numero de 0 a 50
set /a numero_sorteado=%random% %% 51

:tentativa_adivinhar
if %tentativas% leq 0 (
    echo Suas tentativas acabaram! O número sorteado era: %numero_sorteado%.
    pause
    goto fim_adivinhar
)

set /p palpite="Digite seu palpite (%min% a %max%): "

rem Verifica se o palpite é um número válido
if "%palpite%" lss "%min%" if "%palpite%" gtr "%max%" (
    echo Palpite invalido. Tente novamente com um numero entre %min% e %max%.
    goto tentativa_adivinhar
)

rem Verifica se acertou
if "%palpite%" equ "%numero_sorteado%" (
    echo Parabéns! Voce acertou o número sorteado: %numero_sorteado%.
    pause
    goto fim_adivinhar
)

rem Se o palpite estiver errado, informa se o numero é maior ou menor
if "%palpite%" lss "%numero_sorteado%" (
    echo O número sorteado é MAIOR que %palpite%.
) else (
    echo O número sorteado é MENOR que %palpite%.
)

set /a tentativas=%tentativas%-1
echo Voce tem %tentativas% tentativas restantes.
echo ---------------------------------------
goto tentativa_adivinhar

:fim_adivinhar
echo Fim do jogo! Retornando ao menu principal...
pause
goto :eof


:jokenpo 
cls
echo ---------------------------------------
echo           JOGO DE JOKENPO
echo ---------------------------------------
echo Escolha uma das opções abaixo:
echo [1] Pedra
echo [2] Papel
echo [3] Tesoura
echo [M] Menu de jogos
set /p jogador="Digite sua escolha (1, 2 ou 3): "
if /i %jogador% equ m (goto:jogos)
rem Validar a escolha do jogador
if "%jogador%" neq "1" if "%jogador%" neq "2" if "%jogador%" neq "3" (
    echo Escolha invalida. Tente novamente.
    pause
    goto jokenpo
)

rem Gerar escolha do computador
set /a computador=%random% %% 3 + 1

rem Exibir escolha do jogador
if "%jogador%" equ "1" set escolha_jogador=Pedra
if "%jogador%" equ "2" set escolha_jogador=Papel
if "%jogador%" equ "3" set escolha_jogador=Tesoura

rem Exibir escolha do computador
if "%computador%" equ "1" set escolha_computador=Pedra
if "%computador%" equ "2" set escolha_computador=Papel
if "%computador%" equ "3" set escolha_computador=Tesoura

cls
echo ---------------------------------------
echo           JOGO DE JOKENPO
echo ---------------------------------------
echo Voce escolheu: %escolha_jogador%
echo Computador escolheu: %escolha_computador%
echo ---------------------------------------

rem Verificar quem ganhou
if "%jogador%" equ "%computador%" (
    echo Empate!
) else if "%jogador%" equ "1" if "%computador%" equ "3" (
    echo Voce ganhou! Pedra quebra Tesoura.
) else if "%jogador%" equ "2" if "%computador%" equ "1" (
    echo Voce ganhou! Papel cobre Pedra.
) else if "%jogador%" equ "3" if "%computador%" equ "2" (
    echo Voce ganhou! Tesoura corta Papel.
) else (
    echo Computador ganhou!
)

echo ---------------------------------------
pause
goto jokenpo

::----------------------------------------------------------------------------------------------------------------------------------------------

:gerenciamento_de_maquina
cls 
echo.
echo ------------------------------
echo GERENCIAMENTO DE MAQUINA 
echo ------------------------------
echo [D] desligar maquina
echo [I] inicializar maquina
echo [R] retornar ao menu

set /p op=digite uma opcao: 
if /i %op% equ D (goto:desligar_maquina)
if /i %op% equ I (goto:inicializar_maquina)
if /i %op% equ R (goto:mp)  else (
    echo Opcao invalida! Tente novamente.
    pause
    goto gerenciamento_de_maquina
)

:desligar_maquina
echo.
echo Desligando a maquina...
shutdown /s /f /t 0
goto :eof

:inicializar_maquina
echo.
echo Reiniciando a maquina...
shutdown /r /f /t 0
goto :eof

