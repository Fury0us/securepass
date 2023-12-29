#!/bin/bash
asci_logo() {
echo $'\e[36m'
cat << EOF

    dMMMMb  .aMMMb  .dMMMb  .dMMMb 
   dMP.dMP dMP"dMP dMP" VP dMP" VP 
  dMMMMP" dMMMMMP  VMMMb   VMMMb   
 dMP     dMP dMP dP .dMP dP .dMP   
dMP     dMP dMP  VMMMP"  VMMMP"    
EOF
}
generate_password() {
  characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+[]{};:,/?<>|"
  num="0123456789"
  sym='!@#$%^&*()-_=+[]{};:,/?<>|'
  l_case="abcdefghijklmnopqrstuvwxyz"
  u_case="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  length=$(shuf -i 8-12 -n 1)
  password=""
  num_count=0
  sym_count=0
for ((i = 0; i < length; i++)); do
  random_char=${characters:RANDOM % ${#characters}:1}
  password+=$random_char
  if [[ $random_char =~ [$num] ]]; then
    num_count=$((num_count + 1))
  fi

  if [[ $random_char =~ [$l_case] ]]; then
    l_case=$((l_case + 1))
  fi

  if [[ $random_char =~ [$u_case] ]]; then
    u_case=$((u_case + 1))
  fi

  if [[ $random_char =~ [\$sym] ]]; then
    sym_count=$((sym_count + 1))
  fi
    if (( i % 1 == 0 )); then
	clear
    fi
  done
  if (($length >= 9)) && (($length <= 14)) && (($num_count >= 2-3)) && (($sym_count >= 2-3))&&(($l_case >= 2-3)) && (($u_case >= 2-3))
  then
asci_logo
    echo -en '\n'
    echo $'\e[1;31m' && echo "           $password" && echo $'\e[0m'
else
generate_password
  fi
}
generate_password
