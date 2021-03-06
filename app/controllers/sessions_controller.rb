class SessionsController < ApplicationController
  def new
  end

  def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to restaurants_url, notice: "You are now logged in!"
      else
  		      render "new"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_url, notice: "Logged out!"
  end
end


# Let's walk through the code above step by step.

# We don't have to instantiate a user object in our new action because we are only logging in, not creating a new user.
# We find a user by the email typed in the email input field and assign it to the variable 'user'
# We check if that user exists and that it can be authenticated with the password typed in the password input field
# If both of those evaluate to 'true', we create a key-value pair in the session hash. ':user_id' is the key and the user's id is the value
# The session key has been assigned, the user is redirected to the products index page
# This is the entire process of logging in. This gist of logging in is that we are setting a hash in our users' browser to let our server (application) reference as they navigate through the application.

# Now to create the associated session form. Take note that we are using a form_tag and not a form_for here. This is because there is no model associated with a session.
#