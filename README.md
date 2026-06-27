## URL Shortener Service

# Tech Stack
  - Laravel 12
  - PHP 8.1
  - MySQL
  - Laravel Breeze (Authentication)
  - Blade

# Features
  - Authentication
  - Role based Authentication
  - Company Management
  - Invitation System
  - URL Shortner

# Database design
  - Created following tables
  - company, users, short_urls
  - company will conatin id, name, email, created_at, updated_at
  - users will contain id, company_id, role, name, email, password, ccreated_at, updated_at
  - short_url will contain id, company_id, user_id, original_url, short_code, created_at, updated_at

# Roles 
  - SuperAdmin
  - Admin
  - Member
  - Manager
  - Sales
 
# Seeder is used to seed superadmin data  
  - Created a SuperAdminSeeder to seed the superadmin record using raw sql query
  - email is superadmin@yopmail.com and password is 'password'

# Created two more seeder CompanySeeder, UserSeeder
  - Created Company And User seeder to seed the data in databse

# Created a middleware to check the auth of role
  - Created RoleMiddleware to check role is authenticated or not

#  


