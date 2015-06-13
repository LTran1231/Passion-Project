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


helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end
end



===========================================================================
### Organize MVC

app
| - controllers
  | - post.rb
  | - profile.rb
  | - index.rb

app
| - views
  | - articles
    | - edit.erb
    | - new.erb
    | - show.erb
    | - index.erb
  | - categories
    | - index.erb
    | - show.erb

===========================================================================
### User: session Route

HTTP		 request			URL				Action								Named route	Purpose
GET			/users/1			show			user_path(user)				page to show user profile
GET			/signup   		new				new_user_path					page to make a new user (signup)
POST		/users				create		users_path						create a new user (member)
GET			/users/1/edit	edit			edit_user_path(user)	page to edit user with id 1 edit your profile
PATCH		/users/1			update		user_path(user)				update user (submit your changes)
DELETE	/users/1			destroy		user_path(user)				delete user (this site sucks, Don't want to be a member of this club)

===========================================================================

HTTP		 request			URL				Action								Named route	Purpose
GET			/index				index			home							 		main page

