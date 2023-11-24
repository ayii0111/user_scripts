#! /bin/zsh

local overrides='
  "overrides": [
    {
      "files": "*.scss",
      "options": {
        "singleQuote": false
      }
    }
  ],
'
overrides=$(echo "$overrides" | gsed ':a;N;$!ba;s/\n/\\n/g')
gsed -i "/semi*.: false,/ s|$|$overrides|" .prettierrc.json

unset overrides