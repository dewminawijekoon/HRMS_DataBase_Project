# HRMS_DataBase_Project

## Create FrontEnd Server
```
cd FrontEnd
npm install
npm start
```

## Create BackEnd Server
```
//Creating Python Environment
cd BackEnd
python -m venv .venv

//Entering created environment
.venv\Scripts\Activate.ps1

//Installing dependancies
pip install -r requirements.txt

//Run server
uvicorn main:app --reload
```

