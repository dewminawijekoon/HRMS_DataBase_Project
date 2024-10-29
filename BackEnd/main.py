from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from API import employee, users, Leavings, supervisor, listings  # Import all routers

# Initialize the FastAPI application
app = FastAPI()

# Configure CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],  # Specify only allowed origins in production
    allow_credentials=True,
    allow_methods=["*"],  # Allow all HTTP methods (e.g., GET, POST, OPTIONS)
    allow_headers=["*"],   # Allow all headers, necessary for token-based authentication
)

# Include the routers for different modules
app.include_router(employee.router)
app.include_router(users.router)
app.include_router(Leavings.router)
app.include_router(supervisor.router)
app.include_router(listings.router)

# Root route for a welcome message
@app.get("/")
def welcome():
    return {"message": "Welcome to Jupiter HRMS! Still Testing! Test -1000"}
