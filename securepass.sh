#!/bin/bash

# Function to generate a random password
generate_password() {
  # Define acceptable characters
  characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+[]{};:,/?"
  
  # Generate random password length between 8 and 12
  length=$(shuf -i 12-15 -n 1)
  
  # Initialize password variable
  password=""
  num_count=0
  sym_count=0

  # Generate password with desired length
  for ((i = 0; i < length; i++)); do
    random_char=${characters:RANDOM % ${#characters}:1}
    password+=$random_char

    # Count characters and provide update
    if [[ $random_char =~ [0-9] ]]; then
      num_count=$((num_count + 1))
    fi

    if [[ $random_char =~ [@#%^*"$""&""!"-_+,/?] ]]; then
      sym_count=$((sym_count + 1))
    fi
    
    # Provide periodic update every 5 seconds
    if (( i % 1 == 0 )); then
      tput bold ; tput setaf 8 ; echo "Generating Password: $password"
    fi
    sleep 0.1
    clear
  done

  # Password validation
  if ((length >= 10)) && ((length <= 12)) && ((num_count >= 2)) && ((sym_count >= 3)); then
    tput bold ; tput setaf 1 ; echo "Generated password: $password" ; tput sgr0
  else
    generate_password
  fi
}

# Call generate_password function
generate_password
