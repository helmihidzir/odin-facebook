# Odin Facebook

[Ruby on Rails Final Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project)

The core features for the project are 

* Users
* User Profile
* Send and accept friend request 
* Create, edit and delete posts
* News feed
* Like and unlike
* Authentication and Authorization

Only backend.

## Run this project locally

1. Clone this repository to your local machine.

```bash
git clone git@github.com:helmihidzir/odin-facebook.git
```

2. Change into the `odin-facebook` directory.

```bash
cd odin-facebook
```

3. Install the project dependencies using bundler.

```bash
gem install bundler
bundle install
```

4. Create the database.

```bash
rails db:create
```

5. Run the database migrations.

```bash
rails db:migrate
```

6. Start the Rails server.

```bash
rails s
```

7. Lastly, navigate to <http://0.0.0.0:3000> to play around with the project.