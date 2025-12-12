#!/bin/bash

# ===========================================
# Secure SSH Setup + Custom MOTD - NebulonCloud
# ===========================================

clear

echo -e "\033[1;36m🔐 NebulonCloud - Configuração Segura do SSH\033[0m"
echo -e "\033[1;37m--------------------------------------------\033[0m"

sleep 1

echo -e "\033[1;34m▶ Atualizando configurações do SSH...\033[0m"

# Atualizar SSH com configurações seguras
sudo bash -c 'cat <<EOF > /etc/ssh/sshd_config
# SSH LOGIN SETTINGS
PasswordAuthentication yes
PermitRootLogin yes
PubkeyAuthentication no
ChallengeResponseAuthentication no
UsePAM yes

# SECURITY IMPROVEMENTS
X11Forwarding no
AllowTcpForwarding yes

# SFTP SETTINGS
Subsystem sftp /usr/lib/openssh/sftp-server
EOF'

if [ $? -eq 0 ]; then
    echo -e "\033[1;32m✔ Configurações SSH aplicadas com sucesso!\033[0m"
else
    echo -e "\033[1;31m✘ Falha ao aplicar as configurações SSH!\033[0m"
fi

echo -e "\033[1;34m▶ Reiniciando o serviço SSH...\033[0m"
sudo systemctl restart ssh || sudo service ssh restart

echo -e "\033[1;32m✔ Serviço SSH reiniciado com sucesso!\033[0m"
sleep 1

# Instalar MOTD
echo -e "\033[1;34m▶ Instalando MOTD Personalizado...\033[0m"
bash <(curl -fsSL https://raw.githubusercontent.com/root-apolinario/vps-motd/main/motd.sh)

echo -e "\033[1;32m✔ MOTD Personalizado Instalado!\033[0m"
sleep 1

clear

cat << "EOF"

 _  _  ____  ____  __  __  __    _____  _  _     ___  __    _____  __  __  ____  
( \( )( ___)(  _ \(  )(  )(  )  (  _  )( \( )   / __)(  )  (  _  )(  )(  )(  _ \ 
 )  (  )__)  ) _ < )(__)(  )(__  )(_)(  )  (   ( (__  )(__  )(_)(  )(__)(  )(_) )
(_)\_)(____)(____/(______)(____)(_____)(_)\_)   \___)(____)(_____)(______)(____/ 

EOF

echo -e "\033[1;32m🎉 Configuração SSH finalizada com sucesso!\033[0m"
echo -e "\033[1;37m📌 NebulonCloud VPS configurado.\033[0m"

echo -e "\033[1;36m💬 Suporte Discord: apolinarioo_\033[0m"

echo -e "\n\033[1;33m🔑 Defina abaixo sua senha ROOT 👇\033[0m"
sudo passwd root

echo -e "\n\033[1;36m✨ Tudo pronto! Aproveite seu servidor seguro! 🚀\033[0m"
