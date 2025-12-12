#!/bin/bash
# NebulonCloud Advanced MOTD Installer

echo "🔧 Instalando MOTD Personalizado..."

# Desativar mensagens padrão do MOTD do Ubuntu
chmod -x /etc/update-motd.d/* 2>/dev/null

# Criar script dinâmico de estatísticas para o MOTD
cat << 'EOF' > /etc/update-motd.d/00-nebuloncloud
#!/bin/bash

# Cores
CYAN="\e[38;5;45m"
GREEN="\e[38;5;82m"
YELLOW="\e[38;5;220m"
BLUE="\e[38;5;51m"
RESET="\e[0m"

# Estatísticas
LOAD=$(uptime | awk -F 'load average:' '{ print $2 }' | awk '{ print $1 }')
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_PERC=$((MEM_USED * 100 / MEM_TOTAL))
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_PERC=$(df -h / | awk 'NR==2 {print $5}')
PROC=$(ps aux | wc -l)
USERS=$(who | wc -l)
IP=$(hostname -I | awk '{print $1}')
UPTIME=$(uptime -p | sed 's/up //')

# ASCII NebulonCloud
echo -e "${CYAN}"
echo " _  _  ____  ____  __  __  __    _____  _  _     ___  __    _____  __  __  ____  "
echo "( \( )( ___)(  _ \(  )(  )(  )  (  _  )( \( )   / __)(  )  (  _  )(  )(  )(  _ \ "
echo " )  (  )__)  ) _ < )(__)(  )(__  )(_)(  )  (   ( (__  )(__  )(_)(  )(__)(  )(_) )"
echo "(_)\_)(____)(____/(______)(____)(_____)(_)\_)   \___)(____)(_____)(______)(____/ "
echo -e "${RESET}\n"

echo -e "${GREEN} Bem-vindo à NebulonCloud! 🚀 ${RESET}\n"

# Tabela de Informações
echo -e "${BLUE}📊 Informações do Sistema:${RESET} (em $(date))\n"
printf "  ${YELLOW}Carga da CPU    :${RESET} %s\n" "$LOAD"
printf "  ${YELLOW}Uso da Memória  :${RESET} %sMB / %sMB (%s%%)\n" "$MEM_USED" "$MEM_TOTAL" "$MEM_PERC"
printf "  ${YELLOW}Uso do Disco    :${RESET} %s / %s (%s)\n" "$DISK_USED" "$DISK_TOTAL" "$DISK_PERC"
printf "  ${YELLOW}Processos       :${RESET} %s\n" "$PROC"
printf "  ${YELLOW}Usuários Logados:${RESET} %s\n" "$USERS"
printf "  ${YELLOW}Endereço IP     :${RESET} %s\n" "$IP"
printf "  ${YELLOW}Uptime          :${RESET} %s\n\n" "$UPTIME"

echo -e "${CYAN}Suporte via Discord: apolinarioo_${RESET}"
echo -e "Site: ${BLUE}nebuloncloud.xyz${RESET}"
echo -e "${GREEN}Qualidade Sempre — Sem Compromisso 😄${RESET}"
EOF

chmod +x /etc/update-motd.d/00-nebuloncloud

echo "🎉 MOTD da NebulonCloud instalado com sucesso!"
echo "➡ Reconecte via SSH para ver o novo MOTD."
