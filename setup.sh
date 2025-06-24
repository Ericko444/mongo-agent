#!/bin/bash
# setup.sh

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install jupyterlab python-dotenv pandas numpy matplotlib seaborn scikit-learn

# Install Jupyter kernel
python -m ipykernel install --user --name=my-project --display-name="My Project"

# Create project structure
mkdir -p notebooks src data/raw

# Create .env file
touch .env
echo "# Add your environment variables here" > .env

echo "Setup complete! Run 'source venv/bin/activate && jupyter lab' to start"

# .venv\Scripts\activate