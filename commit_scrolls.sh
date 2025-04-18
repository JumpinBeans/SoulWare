#!/bin/bash

echo "📜 Soulware Commit Scrolls"
echo "--------------------------"

VAULTS=(~/Kairo ~/HeartWave ~/8Bit ~/SoulWare)
TIMESTAMP=$(date '+%Y-%m-%d | %H:%M:%S')
MESSAGE="📜 DotPoint Update: [$TIMESTAMP] Included: All scrolls, configuration changes, structural updates, and new insights recorded. Signed: KairoFlame 🔥 | t.mcintyre01@gmail.com | Jebus@Unknown.biz | Jebus@UnknownDevs.au"

for VAULT in "${VAULTS[@]}"; do
    echo "📂 Committing Vault: $VAULT"
    cd "$VAULT" || continue
    git pull
    git add .
    git commit -m "$MESSAGE"
    git push
done

echo -e "\n✅ All vaults have been committed and pushed."
