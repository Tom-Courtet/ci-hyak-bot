#!/bin/sh

# Crée le config.json seulement avec les 2 variables obligatoires
cat <<EOF > config.json
{
    "token": "$DISCORD_TOKEN",
    "applicationId": "$DISCORD_APPLICATION_ID",
    "channelBeta": "1036762035645599755",
    "channelEdit": "954454349210337361",
    "channelBienvenue": "846317312327811092",
    "roleMembre": "845340817828479026",
    "rolePatchNotes": "1012649092343668857",
    "roleIos": "949075801637281812",
    "roleSite": "949075846113669131",
    "roleBonPlan": "948247271290572850",
    "roleAndroid": "949360235011776533",
    "roleGenshin": "948247223894954074",
    "roleBeta": "1036572391201054730",
    "logoUrl": "https://cdn-hyakanime.s3.eu-west-3.amazonaws.com/logo-hyakanime.png", 
    "urlEndpoint": "https://api-v3.hyakanime.fr"
}
EOF

node deploy-commands.js
node index.js