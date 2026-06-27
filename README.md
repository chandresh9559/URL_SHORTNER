## URL Shortener Service

# Tech Stack
  - Laravel 12
  - PHP 8.1
  - MySQL
  - Laravel Breeze (Authentication)
  - Blade
  - Bootstrap 5.3

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

# Flow of the Working flow of the project/assignment
  - There will be multiple roles like superadmin, admin, member, sales, manager
  - Superadmin only can add company(invite the company) and can see the list of   generated short urls, he can not generate short url
  - Admin can invite the team members(sales, manager etc) and another admin as well and admin can generate the short url 
  - Including admin all other users can also generate the short url
  - they can see the list and can download the list in csv fromat as well.
  - I have added sorting as well in the listing of short url like for last month, last week and today

# note: 
  - For the invitation i just simply have created the company/user i have not created/implemented mail function we can do that as well to notify the invited user.
  - I have used a single controller to handle the all reuests except the login. for login i have used laravel breeze.

# Currently all kind of login shared same dashboard but distinguished between the role

# Used AI
  - I used ChatGPT for the discussion of the database design and architecture of the assignment
  - I used copilot to get help in making download functionality of the short url list. we can easily download the csv file of the shorturl list 

# Project Installation

Installation Guide
1. Clone the Repository
git clone https://github.com/chandresh9559/URL_SHORTNER.git
2. Move to the Project Folder
cd URL_SHORTNER
3. Install PHP Dependencies
composer install

4. Configure Database

Open the .env file and update the database credentials.

Example:

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=url_shortener
DB_USERNAME=root
DB_PASSWORD=

5. The databse is attached we can use same database for testing also we can migrate the migtation files.
6. Go to the terminal and hit php artisan serve





