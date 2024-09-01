##Basic

cat  1.sh
#!/bin/bash
# A simple script to print system information
echo "System Information"
echo "=================="
echo "Hostname: $(hostname)"
echo "Current Date and Time: $(date)"
echo "System Uptime: $(uptime -p)"
echo "Logged in Users: $(who)


cat 2.sh

#!/bin/bash

# This is a basic shell script with a shebang line and simple output

# Display a welcome message
echo "Welcome to Shell Scripting!"

# Display the current directory
echo "You are currently in the directory: $(pwd)"


cat 3.sh

#!/bin/bash

# This script demonstrates the use of shell variables and command-line arguments

# Define a shell variable
greeting="Hello"

# Display the greeting with the first command-line argument
echo "$greeting, $1!"

# Check if a second argument is provided
if [ -n "$2" ]; then
    echo "You also mentioned '$2'."
else
    echo "No second argument was provided."
fi

# Display the total number of arguments passed to the script
echo "Total number of arguments: $#"


cat 4.sh
#!/bin/bash
# System Health Check Script
echo "CPU and Memory Usage:"
top -bn1 | head -5
echo "Disk Usage:"
df -h
echo "Active Network Connections:"
netstat -tuln

cat 5.sh

#!/bin/bash

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Prompt for the username
echo "Enter the username to create:"
read username

# Create the user
sudo adduser $username

# Set the password for the user
echo "Enter password for $username:"
sudo passwd $username

# Prompt for the group to assign the user to
echo "Enter group to assign $username to:"
read group

# Create the group
echo "Creating group $group."
sudo groupadd $group

# Add the user to the group
sudo usermod -aG $group $username
echo "$username has been added to $group."

echo "User $username has been created and assigned to the group $group."



### Working with Data

cat 6.sh
# Run the script
sudo ./5.sh

# Script will prompt:
# Enter the username to create: myuser
# (Script creates the user 'myuser' and prompts for password and group)

# Create a file
sudo touch /home/myuser/myfile.txt

# Change ownership to the new user and group
sudo chown myuser:mygroup /home/myuser/myfile.txt

# Set file permissions
sudo chmod 754 /home/myuser/myfile.txt


cat 8.sh
#!/bin/bash

str1="Hello"
str2="World"
combined="${str1}, ${str2}!"
echo "$combined"  # Output: "Hello, World!"

cat 9.sh
#!/bin/bash

echo "Hello, World!" | grep -E '^Hello'


cat 10.sh
#!/bin/bash

echo "Hello, World!" | sed -E 's/^Hello/Hi/'


cat 11.sh
#!/bin/bash

text="There are 123 apples"
echo "$text" | grep -oE '[0-9]+'


cat 12.sh
#!/bin/bash

date="2024-08-11"
if [[ "$date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Date format is correct (YYYY-MM-DD)"
else
    echo "Date format is incorrect"
fi


cat 13.sh
#!/bin/bash

# Ask the user to input a date
read -p "Please enter a date (YYYY-MM-DD): " date

# Validate the date format
if [[ "$date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    echo "Date format is correct (YYYY-MM-DD)"
    echo "Entered Date is : $date "
else
    echo "Date format is incorrect. Please enter the date in YYYY-MM-DD format."
    exit 1
fi


cat 14.sh
#!/bin/bash

# Read input values from the user
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Perform addition using let
let sum=num1+num2

# Display the result
echo "The sum of $num1 and $num2 is: $sum"



cat 15.sh
#!/bin/bash

# Read input values from the user
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Perform subtraction using expr
difference=$(expr $num1 - $num2)

# Display the result
echo "The difference between $num1 and $num2 is: $difference"


cat 16.sh
#!/bin/bash

# Read input values from the user
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Perform multiplication and addition using double parentheses
result=$((num1 * 5 + num2))

# Display the result
echo "The result of ($num1 * 5) + $num2 is: $result"


cat 17.sh
#!/bin/bash

# Read input values from the user
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Perform multiple operations: addition, subtraction, multiplication, and division
sum=$((num1 + num2))
difference=$((num1 - num2))
product=$((num1 * num2))
quotient=$((num1 / num2))

# Display the results
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"


cat 18.sh
#!/bin/bash

# Read input values from the user
read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Perform modulus operation
remainder=$((num1 % num2))

# Display the result
echo "The remainder of $num1 divided by $num2 is: $remainder"


cat 19.sh
#!/bin/bash

# Read an input value from the user
read -p "Enter a number: " num

# Increment the number
let num+=1
echo "After incrementing: $num"

# Decrement the number
let num-=1
echo "After decrementing: $num"



###Controlls


cat 2.sh
#!/bin/bash

number=20

if [ $number -gt 20 ]; then
    echo "The number is greater than 20."
elif [ $number -eq 10 ]; then
    echo "The number is exactly 10."
elif [ $number -lt 200 ]; then
    echo "The number is less than 200"
else
    echo "The number is less than or equal to 20 but not 10."
fi

echo "End of script."


cat 3.sh
#!/bin/bash
services=("docker" "nginx" "mini-httpd")
for service in "${services[@]}"; do
	echo "checking status of $service"
        systemctl is-enabled $service
        systemctl is-active  $service
done


cat 4.sh
#!/bin/bash

# Initialize a counter
count=1

# Loop to check the Docker status 5 times
while [ $count -le 5 ] ; do
    echo "Iteration: $count Started"

    # Check the Docker service status
    if systemctl is-active --quiet docker; then
        echo "Docker is running."
    else
        echo "Docker is not running."
    fi

    echo "Iteration: $count Completed"
    echo "--------------------------------"

    # Increment the counter
    count=$((count + 1))

     sleep 2
done

echo "Docker status check completed."


cat 5.sh
#!/bin/bash
file="data.txt"
until [[ -f $file ]]; do
    echo "Waiting for file: $file"
    sleep 5  # Wait 5 seconds
done
echo "File $file found!"


cat 6.sh
#!/bin/bash

# Get the current day of the week (1 for Monday, 7 for Sunday)
dayOfWeek=$(date +%u)

# Case statement to handle each day of the week
case $dayOfWeek in
  1 )
    echo "Today is Monday. 📝 It's the start of the week! Time to catch up on emails and plan your projects."
    ;;
  2 )
    echo "Today is Tuesday. 💡 The day to get into the groove and tackle those development tasks head-on."
    ;;
  3 )
    echo "Today is Wednesday. 🏃‍♂️ Midweek already! Perfect day for debugging and refactoring."
    ;;
  4 )
    echo "Today is Thursday. 🕒 It's the day for meetings and making sure your code is ready for the weekend."
    ;;
  5 )
    echo "Today is Friday. 🎉 The weekend is near! Time to wrap up and push those final commits."
    ;;
  6 )
    echo "Today is Saturday. 😎 It's the weekend! Relax, recharge, and maybe explore some new tech or hobbies."
    ;;
  7 )
    echo "Today is Sunday. 🌞 Enjoy your rest day! Perfect time to unwind and prepare for the week ahead."
    ;;
  * )
    echo "Unknown day. Something went wrong!"
    ;;
esac


cat age.sh
#!/bin/bash

# Ask the user for their age
read -p "Please enter your age: " age

# Check the age and print a message based on the condition
if [ "$age" -lt 13 ]; then
    echo "You are a child."
elif [ "$age" -ge 13 ] && [ "$age" -lt 20 ]; then
    echo "You are a teenager."
else
    echo "You are an adult."
fi

###File Handling

cat 1.sh
#!/bin/bash

# Check if a filename is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Assign the filename to a variable
filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Read the file line by line
while IFS= read -r line; do
    echo "Processing line: $line"

    # Process each word in the line
    for word in $line; do
        # Perform your processing here. Example: print each word.
        echo "Processing word: $word"
    done

done < "$filename"

cat 1.sh
#!/bin/bash

# Check if a filename is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Assign the filename to a variable
filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found!"
    exit 1
fi

# Read the file line by line
while IFS= read -r line; do
    echo "Processing line: $line"

    # Process each word in the line
    for word in $line; do
        # Perform your processing here. Example: print each word.
        echo "Processing word: $word"
    done

done < "$filename"


cat each_word.sh
#!/bin/bash

# Initialize line counter
line_number=1

# Read each line from the file
while IFS= read -r line; do
    echo "Line $line_number:"

    # Read each word in the current line
    for word in $line; do
        echo "  $word"
    done

    # Increment the line counter
    line_number=$((line_number + 1))
done < "multiline.txt"  # Replace "input.txt" with the name of your text file


###Functions

cat readme.md
String Comparisons
Empty String:

-z "$string": True if the length of $string is zero (i.e., the string is empty).
Non-Empty String:

-n "$string": True if the length of $string is non-zero (i.e., the string is not empty).
Equality:

"$string1" = "$string2": True if $string1 is equal to $string2.
"$string1" == "$string2": Similar to =, often used in [[ ... ]] for enhanced pattern matching.
Inequality:

"$string1" != "$string2": True if $string1 is not equal to $string2.
Pattern Matching (extended test with [[ ... ]]):

[[ "$string" =~ pattern ]]: True if $string matches the specified pattern.
Numeric Comparisons
Equality:

[ "$num1" -eq "$num2" ]: True if $num1 is equal to $num2.
Inequality:

[ "$num1" -ne "$num2" ]: True if $num1 is not equal to $num2.
Greater Than:

[ "$num1" -gt "$num2" ]: True if $num1 is greater than $num2.
Greater Than or Equal To:

[ "$num1" -ge "$num2" ]: True if $num1 is greater than or equal to $num2.
Less Than:

[ "$num1" -lt "$num2" ]: True if $num1 is less than $num2.
Less Than or Equal To:

[ "$num1" -le "$num2" ]: True if $num1 is less than or equal to $num2.
File Tests
File Exists:

[ -e "$file" ]: True if $file exists.
File is a Regular File:

[ -f "$file" ]: True if $file exists and is a regular file (not a directory or other type).
File is a Directory:

[ -d "$file" ]: True if $file exists and is a directory.
File is a Symbolic Link:

[ -L "$file" ]: True if $file exists and is a symbolic link.
File is Readable:

[ -r "$file" ]: True if $file exists and is readable.
File is Writable:

[ -w "$file" ]: True if $file exists and is writable.
File is Executable:

[ -x "$file" ]: True if $file exists and is executable.
File is Non-Empty:

[ -s "$file" ]: True if $file exists and is not empty.
Compound Expressions
AND Condition:

[ condition1 ] && [ condition2 ]: True if both condition1 and condition2 are true.
[[ condition1 && condition2 ]]: True if both condition1 and condition2 are true, using enhanced test syntax.
OR Condition:

[ condition1 ] || [ condition2 ]: True if either condition1 or condition2 is true.
[[ condition1 || condition2 ]]: True if either condition1 or condition2 is true, using enhanced test syntax.
NOT Condition:

[ ! condition ]: True if condition is false.
[[ ! condition ]]: True if condition is false, using enhanced test syntax.



cat 0.sh
#!/bin/bash

# Check if the script received an argument
if [ -z "$1" ]; then
    echo "No argument provided."
else
    echo "The argument provided is: $1"
fi

cat 1.sh
#!/bin/bash

# Define a function that takes one argument
function check_empty {
    # Check if the argument is empty
    if [ -z "$1" ]; then
        echo "The input string is empty."
    else
        echo "The input string is not empty."
	echo "The input string is not empty, it has string called $1"
    fi
}

# Call the function with an empty string
check_empty ""

# Call the function with a non-empty string
check_empty "Hello"


cat 2.sh
#!/bin/bash

# Define a function that takes two arguments
check_two_args() {
    # Check if the first argument ($1) is empty
    if [ -z "$1" ]; then
        echo "The first input string is: empty"
    else
        echo "The first input string is: '$1'"
    fi

    # Check if the second argument ($2) is empty
    if [ -z "$2" ]; then
        echo "The second input string is: empty"
    else
        echo "The second input string is: '$2'"
    fi
}

# Call the function with the arguments passed to the script
check_two_args "$1" "$2"

# Uncomment the following lines to test different scenarios directly in the script

# Call the function with two empty strings
# check_two_args "" ""

# Call the function with one empty and one non-empty string
# check_two_args "" "World"

# Call the function with two non-empty strings
 check_two_args "Hello" "World"

# Call the function with only one argument
# check_two_args "Hello"


cat 3.sh
#!/bin/bash

# ==========================================
# String, Numeric, and File Checks in Bash
# ==========================================

# Common test options for file checks:
# -e : Check if a file exists.
# -r : Check if a file is readable.
# -w : Check if a file is writable.
# -x : Check if a file is executable.
# -d : Check if a directory exists.
# -f : Check if a regular file exists (not a directory or special file).

# ==========================================
# String Checks
# ==========================================

string1="Hello"
string2="World"

# Check if string1 is empty
if [ -z "$string1" ]; then
    echo "string1 is empty"
else
    echo "string1 is not empty"
fi

# Check if string1 equals string2
if [ "$string1" = "$string2" ]; then
    echo "string1 equals string2"
else
    echo "string1 does not equal string2"
fi

# ==========================================
# Numeric Checks
# ==========================================

num1=5
num2=10

# Check if num1 is less than num2
if [ "$num1" -lt "$num2" ]; then
    echo "$num1 is less than $num2"
fi

# ==========================================
# File Checks
# ==========================================

file="/home/shanmukha/hypha-scripts/functions/test-file.txt"

# Check if the file exists
if [ -e "$file" ]; then
    echo "The file exists."

    # Check if the file is readable
    if [ -r "$file" ]; then
        echo "The file is readable."
    fi

    # Check if the file is writable
    if [ -w "$file" ]; then
        echo "The file is writable."
    fi

    # Optional: Check if the file is executable
    if [ -x "$file" ]; then
        echo "The file is executable."
    fi
else
    echo "The file does not exist."
fi


cat 4.sh
#!/bin/bash

# ==========================================
# Functions in Bash: Greetings and Date/Time
# ==========================================

# Define a function to greet a user by name, or use "World" as the default
greet_with_name() {
    local name="${1:-World}"  # Set default value to "World" if no parameter is provided
    echo "Hello, $name"
}

# Call the greet_with_name function without a name (uses default)
greet_with_name

# Call the greet_with_name function with a name
greet_with_name "Alice"

# ==========================================
# Other functions and usage remain the same
# ==========================================

# Define a function to display the current date and time
current_time() {
    echo "Current date and time: $(date)"  # Prints the date and time
}

# Define a function that combines greeting and time display
greet_and_time() {
    greet_with_name "$1"  # Greets the user (or defaults to "World")
    current_time  # Displays the current date and time
}

# Call the greet_and_time function with a name
greet_and_time "Bob"

# Call the greet_and_time function without a name (uses default)
greet_and_time

# Enhanced: Adding a farewell function
farewell() {
    local name="${1:-World}"  # Set default value to "World" if no parameter is provided
    echo "Goodbye, $name"
}

# Call the farewell function with a name
farewell "Charlie"

# Call the farewell function without a name (uses default)
farewell

# Define a function that combines greeting, time, and farewell
greet_time_farewell() {
    greet_with_name "$1"  # Greets the user (or defaults to "World")
    current_time  # Displays the current date and time
    farewell "$1"  # Says goodbye to the user (or defaults to "World")
}

# Call the greet_time_farewell function with a name
greet_time_farewell "Dana"

# Call the greet_time_farewell function without a name (uses default)
greet_time_farewell


cat 5.sh
#!/bin/bash
function add {
    local sum=$(( $1 + $2 ))  # Use `local` for local variables
    echo $sum
}

result=$(add 5 10)  # Call the function and capture the "return" value
echo $result        # Prints: 15


cat 6.sh
#!/bin/bash

# Define the add function that takes two arguments
function add {
    local sum=$(( $1 + $2 ))  # Calculate the sum of the two arguments
    echo $sum                 # Output the sum
}

# Check if two arguments are passed to the script
if [ $# -ne 2 ]; then
    echo "Usage: $0 num1 num2"
    echo "Please provide exactly two numbers as arguments."
    exit 1
fi

# Capture the arguments passed to the script
num1=$1
num2=$2

# Call the add function with the provided arguments and capture the result
result=$(add $num1 $num2)

# Print the result
echo "The sum of $num1 and $num2 is: $result"

cat 7.sh
#!/bin/bash
var="global"

function test_var {
    local var="local"
    echo $var  # Prints: local
}

test_var
echo $var  # Prints: global (original value preserved)

cat 8.sh
#!/bin/bash

# ==========================================
# Variable Scope in Bash: Global vs Local
# ==========================================

# Define a global variable
global_var="I am a global variable"

# Function to demonstrate local variable scope
function demonstrate_local_scope {
    local local_var="I am a local variable"

    # Inside the function, we can access both global and local variables
    echo "Inside function:"
    echo "global_var: $global_var"  # Access the global variable
    echo "local_var: $local_var"    # Access the local variable

    # Modify the global variable inside the function
    global_var="Global variable modified inside function"
    echo "global_var after modification: $global_var"
}

# Call the function to see the local and global variables in action
demonstrate_local_scope

# Outside the function, we can access the global variable, but not the local one
echo "Outside function:"
echo "global_var: $global_var"  # The global variable reflects any changes made inside the function

# Trying to access the local variable outside the function will result in an empty output
# because 'local_var' is not available in the global scope.
echo "local_var: $local_var"  # This will print an empty line

# ==========================================
# Explanation:
# - global_var: Declared outside the function, accessible and modifiable inside and outside the function.
# - local_var: Declared with 'local' inside the function, only accessible within the function.
# ==========================================


### Error handling


cat 1.sh
#!/bin/bash

command lst #This command might succeed or fail
exit_status=$?

if [[ $exit_status -eq 0 ]]; then
    echo "Command executed successfully."
else
    echo "Error: Command failed with exit code $exit_status."
fi


cat 2.sh
#!/bin/bash

# Function to handle errors
handle_error() {
    local error_message="$1"
    echo "Error: $error_message"
    # You can add additional logging or corrective actions here
}

# Execute a potentially risky command
{
    echo "Attempting to run command1..."
    command1  # Replace with your actual command
} || {
    # Handle the error if command1 fails
    handle_error "Command1 failed to execute."
}

echo "Script execution completed."



cat 3.sh
#!/bin/bash

# Function to check if a service is active
check_service_status() {
    local service_name="$1"
    echo "Checking if $service_name service is active..."
    systemctl is-active "$service_name" > /dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo "$service_name service is not active or does not exist."
        return 1
    else
        echo "$service_name service is active."
        return 0
    fi
}

# Function to list directory contents
list_directory_contents() {
    echo "Listing directory contents..."
    ls
}

# Function to handle errors
handle_error() {
    local error_message="$1"
    echo "Error: $error_message"
    # Optional: Add additional logging or corrective actions here
}

# Main script execution
{
    # Check if the Docker service is active
    check_service_status $1

    # List directory contents
    list_directory_contents
} || {
    # If any command in the try block fails, execute this block
    handle_error "An error occurred while executing the commands."
}

echo "Script execution completed."



cat 4.sh
#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
# This helps to catch errors early and prevent the script from continuing with potential issues.
#set -e

# Print each command before executing it.
# This is useful for debugging and understanding the script's flow.
# Uncomment the next line to enable verbose mode.
# set -x

# Treat unset variables as an error when substituting.
# This helps to catch typos or missing variables.
# Uncomment the next line to enable this option.
# set -u

# Treat errors in pipelines as errors.
# By default, only the last command in a pipeline is checked for errors.
# Uncomment the next line to enable this option.
# set -o pipefail

# Function to display the current date and time
show_date() {
    echo "Fetching current date and time..."

    # Execute the 'date' command to show the current date and time
    command date

    # Display the current time using a command substitution
    echo "Current time is: $(date)"
}

# Call the show_date function to display the current date and time
show_date

# Example of a command that is expected to fail
# This will trigger the 'set -e' option and cause the script to exit immediately
echo "Attempting to list contents of a non-existent directory..."
ls /nonexistent_directory

# This line will not be executed due to the failure above
echo "This line will not be printed if the previous command fails."


cat 5.sh
#!/bin/bash
set -x

# Define a function to show date and time
show_date() {
    command date
    echo "Time is $(date)"
}

# Call the function
show_date

# Example of a simple command
echo "Debugging with set -x"


cat 6.sh
#!/bin/bash
set -u
UNSET_VAR="ok for now"

# Define a function to show a greeting
show_greeting() {
    echo "Hello, $1"
}

# Call the function with an argument
show_greeting "World"

# Example of using an unset variable (will cause the script to exit)
echo "This will fail: $UNSET_VAR"

echo "$(date -u)"


cat 7.sh
#!/bin/bash

# Treat unset variables as an error when substituting.
set -u

# Function to demonstrate the effect of `set -u`
demonstrate_set_u() {
    echo "This script will fail if it references an unset variable."

    # Attempt to use an unset variable
    echo "Value of unset variable: $unset_variable"  # This line will cause an error

    # This line will not be executed if the previous line fails
    echo "This message will not be printed due to the unset variable error."
}

# Call the function
demonstrate_set_u


cat 8.sh
#!/bin/bash

# Exit with the status of the last command to fail (or zero if none fail).
set -o pipefail

# Function to demonstrate the effect of `set -o pipefail`
demonstrate_set_o_pipefail() {
    echo "This script demonstrates the effect of `set -o pipefail`."

    # Pipeline with a command that will fail
    # `grep` will fail as there is no such file, and `cat` will return a non-zero exit code
    cat non_existent_file | grep "search_term"

    # Check the exit status of the last command in the pipeline
    if [ $? -ne 0 ]; then
        echo "Pipeline failed."
    else
        echo "Pipeline succeeded."
    fi
}

# Call the function
demonstrate_set_o_pipefail































































































































































































































