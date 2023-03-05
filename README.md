# How to run

first of all clone the project with: ```git clone git@github.com:lemachegabriel/basic-CRM.git```

then follow the next steps: 

* create the db: ```rails db:create```

* run the migrations: ```rails db:migrate```

* load data from csv file into database: ```rails read_csv:load_data```

* create a test user on the rails console: ```rails c``` next ```User.create(email: [your_email], password: [your_password])```

* run the project ```bin/dev```
