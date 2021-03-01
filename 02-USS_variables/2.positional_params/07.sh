#!/bin/bash
V_TITLE="$(basename "$*")"
V_CONTENTS="$(head -5 "$*")"
V_OWNER="$(stat -c %U "$*")"
V_SUPPORT="${V_OWNER}@${HOSTNAME}"
FILE_SIZE="$(stat --printf='File size: %s bytes' "$*")"

tee <<EOF

*** ${V_TITLE^^} ***

=================================

${V_CONTENTS}

=================================
${FILE_SIZE}
In case of any problems please contact administrator (${V_SUPPORT})

EOF