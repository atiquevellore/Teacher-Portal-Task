
# Teacher Portal

This README file contains instructions for setting up, configuring, and running the Teacher Portal application.

## Requirements

### Ruby Version
- **Ruby version:** `3.0.2` (Ensure this version is installed on your system)
- **Rails version:** `7.1.4`

### System Dependencies
- **Database**: SQLite3, which comes pre-configured with Rails.

## Getting Started

### Configuration
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/teacher-portal.git
   cd teacher-portal
   ```

2. Install required gems:
   ```bash
   bundle install
   ```

## Database Setup

### Database Creation
- For SQLite3, run the following to create the database:
  ```bash
  rails db:create
  ```

### Database Initialization
- Run migrations to set up your schema:
  ```bash
  rails db:migrate
  ```

- Optionally, seed the database with initial data:
  ```bash
  rails db:seed
  ```

## Running the Server

- To start the Rails server, run:
  ```bash
  rails s
  ```

## How to Run the Test Suite
- Run migrations
  ```bash
  rake db:test:prepare
  ```
  
- Run tests using `RSpec`:
  ```bash
  rspec
  ```

- You can also run individual tests by specifying the path:
  ```bash
  rspec spec/models/students_controller_spec.rb
  ```
