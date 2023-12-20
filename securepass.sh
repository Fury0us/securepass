#!/bin/bash
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
  if ((length >= 8)) && ((length <= 14)) && ((num_count >= 2)) && ((sym_count >= 2)) && ((l_case >= 1)) && ((u_case >= 2)) || ((length >= 8)) && ((length <= 12)) && ((num_count >= 1)) && ((sym_count >= 4)) && ((l_case >= 1)) && ((u_case >= 1)) || ((length >= 8)) && ((length <= 12)) && ((num_count >= 2)) && ((sym_count >= 3)) && ((l_case >= 1)) && ((u_case >= 1)) || ((length >= 8)) && ((length <= 12)) && ((num_count >= 1)) && ((sym_count >= 2)) && ((l_case >= 3)) && ((u_case >= 1)) || ((length >= 8)) && ((length <= 12)) && ((num_count >= 1)) && ((sym_count >= 2)) && ((l_case >= 3)) && ((u_case >= 1)) || ((length >= 8)) && ((length <= 12)) && ((num_count >= 1)) && ((sym_count >= 3)) && ((l_case >= 2)) && ((u_case >= 2)) || ((length >= 8)) && ((length <= 12)) && ((num_count >= 2)) && ((sym_count >= 2)) && ((l_case >= 3)) && ((u_case >= 1)) || ((length >= 8)) && ((length <= 12)) && ((num_count >= 1)) && ((sym_count >= 3)) && ((l_case >= 1)) && ((u_case >= 1)) || ((length >= 8)) && ((length <= 13)) && ((num_count >= 2)) && ((sym_count >= 2)) && ((l_case >= 3)) && ((u_case >= 1)) || ((length >= 8)) && ((length <= 10)) && ((num_count >= 1)) && ((sym_count >= 3)) && ((l_case >= 1)) && ((u_case >= 1))
  then
    echo -en '\n'
    echo -en '\n'
    echo $'\e[1;31m-------------------------\e[0m'
    echo -en '\n' && echo $'\e[1;31m   --------------------\e[0m'
    echo $'\e[1;31m   |Generated Password|    \e[0m'
    echo $'\e[1;31m   --------------------\e[0m'
    echo -en '\n'
    echo $'\e[1;31m-------------------------\e[0m'
    echo -en '\n'
    echo $'\e[1;36m' && echo "       $password" && echo $'\e[0m'
	exit
  else
    generate_password
  fi
}
generate_password
