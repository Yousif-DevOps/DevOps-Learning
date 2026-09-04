# Labs

Document your completed labs here.

## Lab: Backup.sh

### Objective
Create a script that backs up all .txt files from a source directory into a new timestamped backup folder.

### Commands Used
- `read` to capture user input
- `date +%Y-%m-%d_%H-%M` for a timestamp
- `mkdir -p` to create the backup folder
- `cp` to copy matching files
- `wc -l` to count how many files were copied

### Output
Prompts for a source directory, creates a folder like `backup_2026-09-04_02-30`, copies all `.txt` files into it, and reports how many files were backed up.

### Challenges
Initially ran into "No such file or directory" errors because I was running the script from the wrong working directory. Learned to `cd` into the correct folder first and check with `pwd`/`ls`.

### What I Learned
How to combine `read`, command substitution, and file operations to build a practical automation script.

---

## Lab: Calculator.sh

### Objective
Prompt the user for two numbers and perform addition, subtraction, multiplication, and division.

### Commands Used
- `read` to capture two numbers
- `bc` for arithmetic (bash can't do math natively, especially decimals)
- An `if/else` check to handle division by zero

### Output
Displays all four results, with a graceful error message instead of crashing if dividing by zero.

### Challenges
Learned that bash can't handle arithmetic directly, especially decimals, so I had to pipe expressions into `bc`.

### What I Learned
How to use `bc` for arithmetic and how to validate input before performing an operation.

---

## Lab: FileChecker.sh

### Objective
Check whether a given file exists, and if so, report its read, write, and execute permissions.

### Commands Used
- File test operators: `-e`, `-r`, `-w`, `-x`
- Nested `if/else` blocks

### Output
Reports whether the file exists, and for each permission type, prints a ✓ or ✗.

### Challenges
Understanding the difference between the various file test operators and what each one actually checks.

### What I Learned
How file test operators work and how they're used to validate files before acting on them in a script.

---

## Lab: FileOperations.sh

### Objective
Create a directory and a file inside it, write the current date into the file, and display its contents.

### Commands Used
- `mkdir -p`
- `cd`
- `date +%Y-%m-%d`
- Output redirection with `>`
- `cat` to display file contents

### Output
Creates `bash_demo/demo.txt` containing a message with today's date, then prints the file's contents to confirm it worked.

### Challenges
None major — this one helped reinforce basic file/directory operations.

### What I Learned
How to combine directory creation, output redirection, and file reading into a single script.

## Completed Labs

- [x] Backup.sh
- [x] Calculator.sh
- [x] FileChecker.sh
- [x] FileOperations.sh
