#!/bin/bash
source ./lib.bash

# Test filtering file contents.

TestPhase_Setup ###############################################################

TestAddFile /file.txt $'This is an important line\nThis line is garbage\n'

TestAddConfig 'function MyFilter() { grep -v garbage ; }'
TestAddConfig AddFileContentFilter '/file.txt' MyFilter
# shellcheck disable=SC2016
TestAddConfig 'echo This is an important line > $(CreateFile file.txt)'

TestPhase_Run #################################################################
AconfSave

TestPhase_Check ###############################################################

TestExpectConfig <<EOF
EOF

TestDone ######################################################################
