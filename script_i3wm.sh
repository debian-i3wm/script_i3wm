#!/bin/bash 
comandos=( 

    "echo 'Iniciar a instalação do desktop... (atualizando pacotes)' && sudo apt install i3-wm xorg py3status suckless-tools xfce4-terminal rofi fzf wmctrl pcmanfm lxappearance nitrogen fonts-open-sans fonts-inconsolata arc-theme xz-utils bash-completion alsa-utils pipewire pipewire-audio" 
    "echo 'Instalar aplicativo básicos... (Instalar aplicativos)' && sudo apt install qimgv evince vlc htop mousepad flameshot" 
    "echo 'Instalar pacote libreoffice... (Instalar aplicativo libreoffice)' && sudo apt install --no-install-recommends libreoffice-writer libreoffice-calc libreoffice-impress" 
)  
echo "=== Automação de Comandos ===" 
echo 
for comando in "${comandos[@]}"; do 
    echo "----------------------------------------" 
    echo "Comando pendente: $comando" 
    echo "----------------------------------------" 
    while true; do 
        read -p "Digite (e) para iniciar, (p) pular ou (s) sair do script?:" opcao 
        opcao=$(echo "$opcao" | tr '[:upper:]' '[:lower:]') 
        case "$opcao" in 
            e) 
                echo "-> Executando..." 
                eval "$comando" 
                echo "-> Comando finalizado." 
                break # Sai deste while e vai para o próximo comando 
                ;; 
            p) 
                echo "-> Comando pulado." 
                echo 
                break # Sai deste while e vai para o próximo comando 
                ;; 
            s) 
                echo "-> Saindo do script..." 
                exit 0 
                ;; 
            *) 
                echo "Opção inválida! Digite 'e' para iniciar, 'p' para pular ou 's' para sair." 
                ;; 
        esac 
    done 
done 
echo "Concluido com sucesso" 
