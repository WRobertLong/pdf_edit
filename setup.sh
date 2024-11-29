#!/bin/bash

# setup.sh

# Step 1: Create a virtual environment named after the project
python3 -m venv pdf_edit_env

# Step 2: Add the venv directory and .vscode to .gitignore
echo "pdf_edit_env/" >> .gitignore
echo ".vscode/" >> .gitignore

# Step 3: Activate the virtual environment
source pdf_edit_env/bin/activate

# Step 4: Install dependencies (if requirements.txt exists)
if [ -f requirements.txt ]; then
    pip install -r requirements.txt
else
    echo "No requirements.txt found, skipping dependency installation."
fi

# Step 5: Create the .vscode directory and settings.json
mkdir -p .vscode
cat > .vscode/settings.json <<EOL
{
  "python.defaultInterpreterPath": "./pdf_edit_env/bin/python",
  "python.terminal.activateEnvironment": true
}
EOL

# Step 6: Launch VS Code
code .