#!/bin/bash 
comandos=( 
    "echo 'Atualizar... (Atualizando o sistema)' && sudo apt update && sudo apt upgrade -y"
    "echo 'Iniciar a instalação do desktop... (Instalar desktop)' && sudo apt install i3-wm xorg py3status suckless-tools xfce4-terminal rofi fzf wmctrl pcmanfm lxappearance nitrogen fonts-open-sans fonts-inconsolata arc-theme xz-utils bash-completion alsa-utils pipewire pipewire-audio unzip" 
    "echo 'Instalar aplicativo básicos... (Instalar aplicativos)' && sudo apt install qimgv evince vlc htop mousepad flameshot" 
    "echo 'Instalar pacote libreoffice... (Instalar aplicativo libreoffice)' && sudo apt install --no-install-recommends libreoffice-writer libreoffice-calc libreoffice-impress" 
    "echo 'Instalar login... (Instalar login)' && sudo apt install lightdm lightdm-gtk-greeter" 
    "echo 'Ativar login... (Ativar login)' && sudo systemctl enable lightdm" 
    "echo 'Iniciar login... (Iniciar login)' && sudo systemctl start lightdm" 
)  
echo "=== INSTALAÇÃO DO DESKTOP i3wm ===" 
echo 
for comando in "${comandos[@]}"; do 
    echo "----------------------------------------" 
    echo "INFORME A LETRA PARA CONTINUAR: $comando" 
    echo "----------------------------------------" 
    while true; do 
        read -p "Digite (e) para iniciar, (p) pular ou (s) sair?:" opcao 
        opcao=$(echo "$opcao" | tr '[:upper:]' '[:lower:]') 
        case "$opcao" in 
            e) 
                echo "-> Executando..." 
                eval "$comando" 
                echo "-> Comando finalizado." 
                break
                ;; 
            p) 
                echo "-> Comando pulado." 
                echo 
                break
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
