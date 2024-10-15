# HRMS_DataBase_Project

## Create FrontEnd Server
```
cd FrontEnd
npm install
npm run dev
```

## Create BackEnd Server
Requirements:
- Python3
  
```
//Enable running scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

//Creating Python Environment
python -m venv .venv

//Entering created environment
.venv\Scripts\Activate.ps1

//Upgrade pip
python -m pip install --upgrade pip

//Add .gitignore file
echo "*" > .venv/.gitignore

//Install needed packages
pip install "fastapi[standard]" uvicorn

//Deactivate after working on the project
deactivate
```

## Tailwind CSS
```
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

