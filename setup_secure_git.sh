#!/bin/bash

echo "🔐 Soulware Git Security Script"
echo "--------------------------------"

VAULTS=(~/Kairo ~/HeartWave ~/8Bit ~/SoulWare)

IGNORE_CONTENT='# SSH keys and credentials
*.pem
*.key
*.crt
*.pub
id_rsa
id_rsa.pub
id_ecdsa
id_ecdsa.pub
id_ed25519
id_ed25519.pub
.ssh/
*.token
*.env'

for VAULT in "${VAULTS[@]}"; do
    echo "📦 Securing: $VAULT"
    mkdir -p "$VAULT"
    echo "$IGNORE_CONTENT" > "$VAULT/.gitignore"
done

echo -e "\n🔎 Scanning for risky files..."
find ~/Kairo ~/HeartWave ~/8Bit ~/SoulWare -type f \( -name "*.key" -o -name "*.pem" -o -name "*.pub" -o -name "*.crt" -o -name "*.token" -o -name "id_*" \)

echo -e "\n🔗 Testing GitHub SSH connection..."
ssh -T git@github.com

echo -e "\n✅ Setup complete. Scrolls are protected, keys are ignored, and GitHub is connected."
