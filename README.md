# Rocket Elevators Information System
## Week-4, Team Project Description

The main goal of this week is to transform the static site previously developed during the Genesis program and turn it into a web application on MVC (Model - View - Controller) foundations. The site must be in a state that allows you to create a new section that saves the JavaScripts form that calculates an estimate in the form of a purchase order. This purchase order includes the key elements of the estimation form and allows you to enter more details.

**Here is the information you must enter in the sign in page to access the BackOffice :**
 - user : `admin@admin.com`
 - password : `admin123`

## Members of the team

- **[William Sinclair](https://github.com/WilliamSinclairF)**

- **[Frimina Zaddi](https://github.com/frimina)**

- **[Loïc Rico](https://github.com/ricoloic)**



### The Repo : [Rocket Elevators Information System](https://github.com/WilliamSinclairF/Rocket_Elevators_Information_System)

## Utils

- [Rails](https://guides.rubyonrails.org/)

- [HTML5](https://www.w3schools.com/html/)

- [RUBY](https://www.ruby-lang.org/)

- [JavaScripts](https://www.javascript.com/)

- [CSS](https://css-tricks.com/)

- [Ubuntu](https://www.microsoft.com/en-ca/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab)

## Term

 - [Gemfile](https://rubygems.org/) - A format for describing gem dependencies for Ruby programs

 - [Bundle](https://bundler.io/) - Ruby Dependency Management

 - [Migrations](https://edgeguides.rubyonrails.org/active_record_migrations.html) - Convenient way to alter your database schema over time in a consistent way.

 - [MySQL](https://www.mysql.com/) - an open-source database management software that helps users store, organize, and later retrieve data

## How to use
#### A. Install Ruby on Rails

 - Follow the instructions for installing Ruby on Rails depending on your operatiing system
 - For Mac computer : [OSx](https://gorails.com/setup/osx/10.15-catalina)
 - For Ubuntu computer : [Ubuntu](https://gorails.com/setup/ubuntu/18.04)
 - For Windows computer : [Windows](https://gorails.com/setup/windows/10)

	**The main installations that you will need to do in order for the program to run well**
	1. Installing Homebrew
	2. Installing Ruby
	3. Configuring Git
	4. Installing Rails
	5. Setting Up A Database
	6. Installing and setting MySQL
	7. Installing and setting PostgreSQL

	**If you have any problems during installation, google is your best friend.**

	**Here is a list of forums that might help you :**
	1. [StackOver-Flow](https://stackoverflow.com/)
	2. [Reddit](https://www.reddit.com/)
	3. [Ask Ubuntu](https://askubuntu.com/)
	4. [Mozilla](https://developer.mozilla.org/)


#### B. Setting up databases

 > **When all the installation are done, you have to create a test application to validate that everything is set up correctly. If all goes well, the installation should end by displaying : Yay! You're on Rails! If so, you are now ready to run the program. Do not forget to visit the [Rails official website](https://rubyonrails.org/) if you want to understand some aspects of the program. When you download the program, make sure that the file `config/database.yml` is set correctly. If it's not the case. The program might show you some error when you lunch the server.**

 - Use this command to install the dependencies specified in your Gemfile : **`bundle install`**

	Other Bundler command that can be useful : [Bundler](https://bundler.io/bundle_install.html) or [StackOver-Flow](https://stackoverflow.com/questions/7304576/how-do-i-set-up-the-database-yml-file-in-rails)

	If you have error with the Bundler, this link can help you : [Using Bundler To Install Gems](https://help.dreamhost.com/hc/en-us/articles/115001070131-Using-Bundler-to-install-Ruby-gems)

	Site where you can find some gems : [Ruby Gems](https://guides.rubygems.org/rubygems-basics/)

	 **Sometimes you have to run this command in order to reset your database**

	- **`db:create`** : creates the database
	- **`db:drop`** : deletes the database
	- **`db:setup`** : does db:create, db:schema:load, db:seed
	- **`db:reset`** : does db:drop, db:setup
	- **`db:migrate`** : reset does db:drop, db:create, db:migrate
	- **`db:seed`** : use the file **`db/seed`** to populate the database

#### C. Running the program

 1. Enter in the file of the program with : **`cd file_name`**

 2. Make sure the all the migration are done with **`rails db:migrate`**.

 3. Run the server with : **`rails server`**

#### D. Exploring the Rocket Elevator Website <br>

 > **The main program of our website is on the quotes page. From this page, you can get a quote for the type of building you are looking for. We have three types of elevator to satisfy everyone. To do this, you must log in using the sign in button. After that, the information that you send to the program will enter in the database. This data will allow us to give you the best service according to your needs. Know that all your modifications as well as all your quotes are carefully saved and you can access them by going to your account.**

#### E. Acesss to our code
 Here is the most important folder and files that makes sure that our program runs well

 - **`app/views`** : Most of our different html codes that make up the website. The files are a combination of HTML and Embedded Ruby

 - **`db`** Folder : All the database related files go inside this folder. The configuration, schema, and migration files can be found here, along with any seed files.

 - **`app/models`** : This folder make sure the you find a particular data that you're looking for, update that data and remove data.

 - **`app/controllers`** : This is where all the controller files go. Controllers are responsible for orchestrating the model and views.

 - **`config/routes`** : The rails router recognizes our different URLs and dispatches them to a controller's action

 - **`config/database.yml`** : This file holds all the database configuration the application needs. many different configurations can be set for different environments.

 - **`config/environment.rb`** : This file requires **`application.rb`** to initialize the Rails application.

 - **`Gemfile`** : The Gemfile is the place where all your app’s gem dependencies are declared.

	For more information about the rails directory structure, please visit this [Site](https://www.sitepoint.com/a-quick-study-of-the-rails-directory-structure/)

#### F. Our different database

 > **For more control of the database, we suggest you to install [MySQL](https://www.mysql.com/fr/products/workbench/) workbench. It works almost with all operating system. To download the program, you must make sure that you have an account with oracle. If it's not the case, here is the link to [Register](https://cutt.ly/Bgg9JBs)**
 > 
 > **You can also add it in a code editor like visual studio code or IntelliJ IDEA. These different programs allow you to modify database tables more easily. You can also see our database through the terminal. Depending on the computer, you must find the appropriate command to open MySQL.**

Here are examples of commands on MySQL :
 - Quote.all : show us all quotes that have been submitted
 - Quote.find(1) : show us the first submission.
 - Quote.new and Quote.create : create a new instance of the quote

You'll find all the information about MySQL command in this [Site](https://dev.mysql.com/doc/)

There is 3 tables which constitute our database, We have users, employees, and quotes. We have inserted 7 employees who will be in our database to start, you will find them, if you connect as admin in the site, or through the **BackOffice** section of the site.

#### G. Set-Up A DataBase
The next step was to set up a new database on rails but this time with PostgreSQL
Here is the **[link](https://medium.com/@primazp/multiple-databases-in-rails-part-1-setup-48f6d207685a)** that allowed us to set up different databases on rails

We have build a data warehouse to analyze the facts of the business. Here are the tables they contain :  
- FactQuotes
- FactContact
- FactElevator
- DimCustomers

You can find all the settings on **`db_dwh/schema.rb`**

We need to build a data warehouse to analyze the facts of the business, so we have include the following facts : 
 - Quote Requests
 - Contact requests
 - Commissioning of elevators

These data allow us to answer three main questions:
 - How many contact requests are made per month ?
 - How many bid solicitations are made per month ?
 - How many elevators per customer do we have ?

Three database queries are required to select the warehouse data that answers these three questions. These SELECT queries will return :
 - The number of unique requests (ContactId) grouped by Month 
 - The number of unique requests (QuoteId) grouped by Month
 - The number of elevators (ElevatorId) contained in the buildings belonging to each customer

The data warehouse works under PostgreSQL. You have several ways of seeing the different tables, either from the teriminal, a software that manipulates PostgreSQL or from the backoffice section of our website.

Here's the link to download **[PgAdmin](https://www.pgadmin.org/)** who is well known in the developer community. It works with all operating systems. 

The name of the PostgreSQL databases and their parameters can be found in the **`dhw_db.yml`** file. ***DWH*** stands for data warehouse.

The data of the new tables that we have created are created from the data already set up on MySQL. You can find all these different parameters in the **`lib/dwh/sync.rb`** file. The **`lib/task/sync.rake`** allows us to synchronize the data that is transmitted to it from **`sync.rb`**. 

## [Schema](https://dbdiagram.io/d/5f92e1423a78976d7b78e81d)

![hustlin_erd](https://i.imgur.com/NTcfYav.png)


### This concludes the presentation of the program, do not hesitate to share with us any suggestions or improvements.
