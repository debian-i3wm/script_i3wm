
    "echo 'Instalar login... (Instalar login)' && sudo apt install lightdm lightdm-gtk-greeter" 
    "echo 'Ativar login... (Ativar login)' && sudo systemctl enable lightdm" 
    "echo 'Iniciar login... (Iniciar login)' && sudo systemctl start lightdm" 

#!/bin/bash
declare -A comandos
comandos=(
    ["Atualizar o sistema"]="sudo apt update && sudo apt upgrade -y"
    ["Instalar o desktop"]="sudo apt install i3-wm xorg py3status suckless-tools xfce4-terminal rofi fzf wmctrl pcmanfm lxappearance nitrogen fonts-open-sans fonts-inconsolata arc-theme xz-utils bash-completion alsa-utils pipewire pipewire-audio unzip"
    ["Instalar aplicativos básicos"]="sudo apt install qimgv evince vlc htop mousepad flameshot"
    ["Instalar o LibreOffice"]="sudo apt install --no-install-recommends libreoffice-writer libreoffice-calc libreoffice-impress"
    ["Instalar "]="cat firefox.tar.gz.* > firefox.tar.gz & tar -xzvf firefox.tar.gz & sudo mv firefox.desktop /usr/share/applications"
    ["Ti"]="command"
    ["Ti"]="command"
    ["Ti"]="command"
)

# Ordem de execução manual (necessária porque arrays associativos não mantêm a ordem)
ordem_execucao=(
    "Atualizar o sistema"
    "Instalar o desktop"
    "Verificar informações do sistema"
    "Testar comando inválido"
    ""
    ""
    ""
    ""
    ""
)

# Arrays para armazenar o relatório final
sucesso=()
erro=()
pulados=()

echo "=== Iniciando a execução sequencial de tarefas ==="
echo ""

# Loop através da ordem definida
for titulo in "${ordem_execucao[@]}"; do
    cmd="${comandos[$titulo]}"
    
    echo "------------------------------------------------"
    echo "Próxima tarefa: $titulo"
    
    # Solicita a ação do usuário
    read -n 1 -r -p "Pressione [P] para pular ou qualquer outra tecla para iniciar (Ctrl+C para sair)... " opcao
    echo "" # Quebra de linha visual

    # Transforma a resposta em minúscula
    if [[ "${opcao,,}" == "p" ]]; then
        pulados+=("$titulo")
        echo -e "[PULADO] Tarefa pulada pelo usuário."
        continue
    fi
    
    echo -e "Executando...\n"
    
    # Executa o comando
    if eval "$cmd"; then
        sucesso+=("$titulo")
        echo -e "\n[OK] Tarefa concluída com sucesso."
    else
        erro+=("$titulo")
        echo -e "\n[ERRO] A tarefa acima falhou."
    fi
done

# Exibição do relatório final
echo "================================================"
echo "               RELATÓRIO FINAL                  "
echo "================================================"
echo "RESUMO QUANTITATIVO:"
echo "  - Sucesso: ${#sucesso[@]}"
echo "  - Erro:    ${#erro[@]}"
echo "  - Pulados: ${#pulados[@]}"
echo "------------------------------------------------"

echo "Tarefas executadas com SUCESSO:"
if [ ${#sucesso[@]} -eq 0 ]; then
    echo "  Nenhuma"
else
    for titulo in "${sucesso[@]}"; do
        echo "  - $titulo"
    done
fi

echo ""
echo "Tarefas que apresentaram ERRO:"
if [ ${#erro[@]} -eq 0 ]; then
    echo "  Nenhuma"
else
    for titulo in "${erro[@]}"; do
        echo "  - $titulo"
    done
fi

echo ""
echo "Tarefas PULADAS:"
if [ ${#pulados[@]} -eq 0 ]; then
    echo "  Nenhuma"
else
    for titulo in "${pulados[@]}"; do
        echo "  - $titulo"
    done
fi
echo "================================================"
