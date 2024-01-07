#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-

# Comment-text after "#= " is expected output.
echo '// Chat test:'
CHAT_JSON='{
  "chat": [
    { "nick": "Bernd", "msg": "hello" },
    { "nick": "Bernd", "msg": "what\u0027s up?" },
  ]
}'

echo '// Message texts printed shell-safe:'
CODE='data.chat.forEach(x => clog(shq(x.msg)))
  ' DATA="$CHAT_JSON" node -r enveval2401-pmb -e 0
#= hello
#= 'what'\''s up?'

echo '// Messages as bash dicts entries:'
CODE='data.chat.forEach(x => clog(toBashDictSp(x)))
  ' DATA="$CHAT_JSON" node -r enveval2401-pmb -e 0
#= [nick]=Bernd [msg]=hello
#= [nick]=Bernd [msg]='what'\''s up?'






# scroll
