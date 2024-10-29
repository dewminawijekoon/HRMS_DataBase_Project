import logging
import os
from typing import List

from classes.employee import Pie_graph_gender, Pie_graph_pay_department, Pie_graph_pay_grade, Pie_graph_role
import mysql.connector
from dotenv import load_dotenv
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from mysql.connector import pooling
import uuid
from core.security import get_current_active_user
# Initialize logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Query for counting absent employees
router = APIRouter()

# Dependency for OAuth2 token
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

# Database connection
load_dotenv()

async def get_db():
    connection = mysql.connector.connect(host=os.getenv('DB_HOST'), user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'), database=os.getenv('DB_NAME'))
    cursor = connection.cursor(dictionary=True)
    try:
        yield cursor, connection
    finally:
        cursor.close()
        connection.close()

@router.get("/all_admins")
async def admin_list(db=Depends(get_db), current_user=Depends(get_current_active_user)):
    cursor, _ = db

    try:
        # Check if the current user is an admin (can be done before fetching admins)
        cursor.callproc("is_admin", [current_user.username])
        admin_record = next(cursor.stored_results()).fetchone()
        is_admin = admin_record["is_admin"] if admin_record else False

        if not is_admin:
            raise HTTPException(status_code=403, detail="Not authorized to view admin list")

        # Fetch all admin details using the 'admins' stored procedure
        cursor.callproc("admins")
        admin_records = next(cursor.stored_results()).fetchall()

        if not admin_records:
            raise HTTPException(status_code=404, detail="No admins found")

        # Map the SQL result to a response list of dictionaries
        admin_list = [
            {
                "first_name": record["first_name"],
                "last_name": record["last_name"],
                "employee_id": record["employee_id"]
            }
            for record in admin_records
        ]

        return admin_list

    except mysql.connector.Error as e:
        logger.error(f"Database error while fetching admin details: {str(e)}")
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=f"Database error: {str(e)}")

    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=f"Unexpected error: {str(e)}")
    


@router.get("/pie_graph_gender", response_model=List[Pie_graph_gender])
def graph_by_gender(db=Depends(get_db), current_user=Depends(get_current_active_user)):
    cursor, connection = db
    try:
        # Fetch the employee_id of the current user
        cursor.callproc("get_employee_id_by_username", [current_user.username])
        user_record = next(cursor.stored_results()).fetchone()

        if not user_record:
            raise HTTPException(status_code=404, detail="User not found")

        # Fetch the gender percentages for employees
        cursor.callproc("employees_by_gender_presentages")
        results = next(cursor.stored_results()).fetchall()  # Assuming multiple rows are returned

        if not results:
            raise HTTPException(status_code=404, detail="No gender data found")

        # Convert the results into a list of Pie_graph_gender instances
        pie_chart_data = [Pie_graph_gender(gender=row["gender"], presentage_by_gender=row["presentage_by_gender"])
                          for row in results]

        logger.info("Fetched pie chart data by gender successfully")
#s
        return pie_chart_data

    except mysql.connector.Error as e:
        logger.error(f"Database error while fetching graph data: {str(e)}")
        connection.rollback()
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=f"Database error: {str(e)}")

    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Unexpected error occurred")




@router.get("/pie_graph_paygrade", response_model=List[Pie_graph_pay_grade])
def graph_by_paygrade(db=Depends(get_db), current_user=Depends(get_current_active_user)):
    cursor, connection = db
    try:
        # Fetch the employee_id of the current user
        cursor.callproc("get_employee_id_by_username", [current_user.username])
        user_record = next(cursor.stored_results()).fetchone()

        if not user_record:
            raise HTTPException(status_code=404, detail="User not found")

        # Fetch the pay grade percentages for employees
        cursor.callproc("employees_by_pay_grade_presentages")
        paygrade_results = next(cursor.stored_results()).fetchall()  # Assuming multiple rows are returned

        if not paygrade_results:
            raise HTTPException(status_code=404, detail="No pay grade data found")

        # Convert the results into a list of PieGraphPayGrade instances
        pie_chart_data = [
            Pie_graph_pay_grade(pay_grade=row["pay_grade"], presentage_by_pay_grade=row["presentage_by_pay_grade"])
            for row in paygrade_results
        ]

        logger.info("Fetched pie chart data by pay grade successfully")

        return pie_chart_data

    except mysql.connector.Error as e:
        logger.error(f"Database error while fetching graph data: {str(e)}")
        connection.rollback()
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=f"Database error: {str(e)}")

    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Unexpected error occurred")


@router.get("/pie_graph_role", response_model=List[Pie_graph_role])
def graph_by_role(db=Depends(get_db), current_user=Depends(get_current_active_user)):
    cursor, connection = db
    try:
        # Fetch the employee_id of the current user
        cursor.callproc("get_employee_id_by_username", [current_user.username])
        user_record = next(cursor.stored_results()).fetchone()

        if not user_record:
            raise HTTPException(status_code=404, detail="User not found")

        # Fetch the role percentages for employees
        cursor.callproc("employees_by_role_presentages")
        role_results = next(cursor.stored_results()).fetchall()  # Assuming multiple rows are returned

        if not role_results:
            raise HTTPException(status_code=404, detail="No role data found")

        # Convert the results into a list of PieGraphRole instances
        pie_chart_data = [
            Pie_graph_role(role=row["job_title"], presentage_by_role=row["presentage_by_role"])
            for row in role_results
        ]

        logger.info("Fetched pie chart data by role successfully")

        return pie_chart_data

    except mysql.connector.Error as e:
        logger.error(f"Database error while fetching graph data: {str(e)}")
        connection.rollback()
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail=f"Database error: {str(e)}")

    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Unexpected error occurred")

@router.get("/pie_graph_department", response_model=List[Pie_graph_pay_department])
async def get_pie_graph_department(db=Depends(get_db), current_user=Depends(get_current_active_user)):
    cursor, _ = db

    try:
        # Call stored procedure or execute SQL query
        cursor.callproc('employee_by_department_presentages')
        department_data = next(cursor.stored_results()).fetchall()

        if not department_data:
            raise HTTPException(status_code=404, detail="No department data found")

        # Validate and map SQL query results to the PieGraphPayDepartment model
        pie_graph_response = []
        for row in department_data:
            # Ensure 'presentage_by_department' is present
            if 'presentage_by_department' not in row:
                logger.error("Missing 'presentage_by_department' field in database response")
                raise HTTPException(status_code=500, detail="Missing 'presentage_by_department' field in response")

            pie_graph_response.append(
                Pie_graph_pay_department(
                    department_name=row['department_name'],
                    presentage_by_department=row['presentage_by_department']
                )
            )

        return pie_graph_response

    except mysql.connector.Error as e:
        logger.error(f"Database error: {str(e)}")
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Database error occurred")

    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        raise HTTPException(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, detail="Unexpected error occurred")