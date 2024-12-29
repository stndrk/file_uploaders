# User File Uploader

## Steps to set up the application

1. **Clone the Repository**
   ```bash
   git clone https://your-repository-url.git
   cd your-repository-folder

2. **Install Ruby Package Manager (e.g., rbenv) Install a Ruby version manager like rbenv or rvm**
   refer this document: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos

3. **Install ruby version 3.2.2**
   rbenv install 3.2.2

3. **Switch to Ruby Version 3.2.2 and Install Dependencies** 
   rbenv local 3.2.2

4. **Install PostgreSQL and Its Dependencies** 
   sudo apt install postgresql postgresql-contrib

5. bundle install
6. rails db:create
7. rails db:migrate
8. Create an .env file in the root directory of the project and add mail and password
9. **Run the Rails Application**
   rails s

