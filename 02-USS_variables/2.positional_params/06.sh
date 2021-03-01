#!/bin/bash

V_TITLE="$(basename $1)"
V_CONTENTS="$(cat $1)"
V_SUPPORT="${USER}@${HOSTNAME}"

tee <<EOF

*** ${V_TITLE^^} ***

=================================

${V_CONTENTS}

=================================

In case of any problems please contact administrator (${V_SUPPORT})
EOF

./06_HERE.sh ../report.txt