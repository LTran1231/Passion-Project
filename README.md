### Quickstart

1.  `bundle install`
2.  `shotgun config.ru`

As needed, create models & migrations with the `rake` tasks:

```
rake generate:migration  # Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks
rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
```

### Contributing

We would love for you to help make the skeleton more awesome, There are three ways to contribute:

1. Ask for a bug fix or enhancement!
2. Submit a pull request for a bug fix or enhancement!
3. Code review an open pull request!




===========================================================================
### Organize MVC
```
app
| - controllers
  | - post.rb
  | - profile.rb
  | - index.rb

app
| - views
  | - sessions
    | - signin.erb
    | - signout.erb
    | - signup.erb
  | - users
    | - edit.erb
    | - .erb
```
===========================================================================
```
HTTP    request    URL            Named route   Action Purpose
GET     /signin    login_path     new page     for a new session (signin)
POST    /signin    login_path     create       form to sign in (signin)
GET     /signout   logout_path    destroy      delete a session (Sign out)

GET			/signup    new			new_user_path			page to make a new user (signup)
POST		/signup	   create		users_path				create a new user (member)
```
===========================================================================
### Profile: session Route
```
HTTP     request      URL       Action                Named route Purpose
GET     /users/1      show      user_path(user)       page to show user profile
GET     /users/1/edit edit      edit_user_path(user)  page to edit user with id 1 edit your profile
PATCH   /users/1      update    user_path(user)       update user (submit your changes)
DELETE  /users/1      destroy   user_path(user)       delete user
```

===========================================================================
### local port error

TCPServer Error: Address already in use
```
lsof -wni tcp:9393
kill -9 <PID>

===========================================================================
###







