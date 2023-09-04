# RoboFrameworkProject
#Install python 3
brew install python
alias python=  /usr/local/bin/python3
#Install require libraries

cd to the directory where requirements.txt is located.
pip install -r requirements.txt

robot command
robot -d Results --variablefile Files/env/mkt_dev_env.py   Tests/Domain/Domain.txt
xzcx