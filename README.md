# Smart C-CFG Parser (Flex + Bison + C)
This project implements a **smart context-free grammar (CFG) parser** for a simplified C-like language using **Flex**, **Bison**, and **C**.
Unlike a traditional parser that only reports “Valid program” or “Invalid program”, this system performs **intelligent error analysis**, provides **human-readable explanations**, and even generates a **corrected version** of invalid programs.
---
## Features
###  Smart Error Detection
The parser identifies common syntax errors such as:
- Missing semicolons
- Missing parentheses
- Missing or extra braces
- Unexpected tokens
- Invalid function headers
- Misplaced statements
###  Human-Friendly Error Reports
For invalid programs, the parser outputs:
=== filename.txt === Original code: <original input>
Error: <short description>
Why: <grammar-based explanation>
Suggestion: <how to fix it>
Rewritten code: <corrected version of the program>
Code
###  Auto-Rewrite Engine
The parser attempts to **minimally correct** invalid code while preserving the original structure.
###  Batch Testing
A `run_tests.bat` script:
- Runs all files in `tests/valid/` and `tests/invalid/`
- Feeds them into the parser
- Saves smart output into:
smart_output/valid/ smart_output/invalid/
Code
###  Clean Project Structure
C-CFG-Project/ │ ├── lexer.l ├── parser.y ├── src/ │ └── driver.c │ ├── tests/ │ ├── valid/ │ └── invalid/ │ ├── smart_output/ │ ├── valid/ │ └── invalid/ │ ├── run_tests.bat └── README.md
Code
---
##  Build Instructions
### 1. Generate Lexer and Parser
```bash
flex lexer.l
bison -d parser.y
2. Compile
bash
gcc src/driver.c parser.tab.c lex.yy.c -o parser.exe
 Running the Parser (Interactive Mode)
bash
parser.exe
Paste your code, then press:
Code
Ctrl + Z
Enter
 Running All Tests
bash
run_tests.bat
Smart output will be saved into the smart_output/ folder.
Purpose
This project demonstrates:
•
Compiler front-end design
•
Lexical analysis
•
Syntax analysis
•
Error recovery
•
Automated code correction
•
Batch testing and structured output
It is ideal for learning or teaching compiler construction concepts.
License
This project is open-source. Feel free to use, modify, or extend it.# C-CFG-Project
A smart C‑CFG parser built with Flex, Bison, and C. Includes intelligent error detection, explanations, suggestions, and auto‑rewritten corrected code. Supports batch testing, structured output, and organized test suites.
