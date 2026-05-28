#!/bin/bash
declare -A comandos
comandos=(
    ["Atualizar o sistema"]="sudo apt update && sudo apt upgrade -y"
    ["Instalar o desktop"]="sudo apt install i3-wm xorg py3status suckless-tools xfce4-terminal rofi fzf wmctrl pcmanfm lxappearance nitrogen fonts-open-sans fonts-inconsolata arc-theme xz-utils bash-completion alsa-utils pipewire pipewire-audio unzip -y"
    ["Instalar aplicativos básicos"]="sudo apt install qimgv evince vlc htop mousepad flameshot -y"
    ["Instalar o LibreOffice"]="sudo apt install --no-install-recommends libreoffice-writer libreoffice-calc libreoffice-impress -y"
    ["Instalar Navegador"]="cat firefox.tar.gz.* > firefox.tar.gz & sudo tar -xzvf firefox.tar.gz -C /opt"
    ["Continuar instalação do Navegador"]="sudo mv firefox.desktop /usr/share/applications"
    ["Instalar tela de login"]="sudo apt install lightdm lightdm-gtk-greeter -y"
    ["Ativar tela de login"]="sudo systemctl enable lightdm"
    ["Iniciar tela de login"]="sudo systemctl start lightdm"
)
ordem_execucao=(
   "Atualizar o sistema"
    "Instalar o desktop"
    "Instalar aplicativos básicos"
    "Instalar o LibreOffice"
    "Instalar Navegador"
    "Continuar instalação do Navegador"
    "Instalar tela de login"
    "Ativar tela de login"
    "Iniciar tela de login"
)
sucesso=()
erro=()
pulados=()
total_tarefas=${#ordem_execucao[@]}
contador_atual=0
echo "=== INICIAR A INSTALAÇÃO ==="
echo "Total de comandos: $total_tarefas"
echo ""
for titulo in "${ordem_execucao[@]}"; do
    cmd="${comandos[$titulo]}"
    ((contador_atual++))
    faltam=$((total_tarefas - contador_atual))
    echo "------------------------------------------------"
    echo "Comandos: $contador_atual/$total_tarefas - $titulo"
    echo "Faltam: $faltam comando(s) para encerrar"
    echo "------------------------------------------------"
    read -n 1 -r -p "Pressione [P] para pular ou qualquer outra tecla para iniciar (Ctrl+C para sair)... " opcao
    echo ""
    if [[ "${opcao,,}" == "p" ]]; then
        pulados+=("$titulo")
        echo -e "[PULADO] Comandos não executados pelo usuário."
        continue
    fi
    echo -e "Executando...\n"
    if eval "$cmd"; then
        sucesso+=("$titulo")
        echo -e "\n[OK] Comandos concluído com sucesso."
    else
        erro+=("$titulo")
        echo -e "\n[ERRO] falhou na execução."
    fi
done
echo "================================================"
echo "               RELATÓRIO FINAL                  "
echo "================================================"
echo "RESUMO DOS COMANDOS:"
echo "  - Sucesso: ${#sucesso[@]}"
echo "  - Erro:    ${#erro[@]}"
echo "  - Pulados: ${#pulados[@]}"
echo "------------------------------------------------"

echo "COMANDOS COM SUCESSO:"
if [ ${#sucesso[@]} -eq 0 ]; then
    echo "  Nenhuma"
else
    for titulo in "${sucesso[@]}"; do
        echo "  - $titulo"
    done
fi
echo ""
echo "COMANDOS COM ERRO:"
if [ ${#erro[@]} -eq 0 ]; then
    echo "  Nenhuma"
else
    for titulo in "${erro[@]}"; do
        echo "  - $titulo"
    done
fi
echo ""
echo "COMANDOS NÃO EXECUTADOS:"
if [ ${#pulados[@]} -eq 0 …. ]; then
    echo "  Nenhuma"
else
    for titulo in "${pulados[@]}"; do
        echo "  - $titulo"
    done
fi
echo "====================FIM DA INSTALAÇÃO============================"
