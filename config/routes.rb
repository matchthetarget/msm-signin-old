Rails.application.routes.draw do
  # Routes for the Bookmark resource:

  # CREATE
  match("/insert_bookmark", { :controller => "bookmarks", :action => "create", :via => "post"})
          
  # READ
  match("/bookmarks", { :controller => "bookmarks", :action => "index", :via => "get"})
  
  # match("/bookmarks/:id_from_path", { :controller => "bookmarks", :action => "show", :via => "get"})
  
  # UPDATE
  
  # match("/modify_bookmark/:id_from_path", { :controller => "bookmarks", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_bookmark/:id_from_path", { :controller => "bookmarks", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for signing up

  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})
  
  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_user", { :controller => "users", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_user", { :controller => "users", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})


  #------------------------------

  get("/", { :controller => "movies", :action => "index" })

  # Movie routes

  # CREATE
  get("/insert_movie_record", { :controller => "movies", :action => "create" })

  # READ
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/last_decade", { :controller => "movies", :action => "last_decade" })
  get("/movies/long", { :controller => "movies", :action => "long" })
  get("/movies/short", { :controller => "movies", :action => "short" })
  get("/movies/:the_movie_id", { :controller => "movies", :action => "show" })

  # UPDATE
  get("/update_movie/:the_movie_id", { :controller => "movies", :action => "update" })

  # DELETE
  get("/delete_movie/:the_movie_id", { :controller => "movies", :action => "destroy" })
  
  # Director routes

  # CREATE
  get("/insert_director_record", { :controller => "directors", :action => "create" })

  # READ
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:the_director_id", { :controller => "directors", :action => "show" })

  # UPDATE
  get("/update_director/:the_director_id", { :controller => "directors", :action => "update" })
  
  # Actor routes

  # CREATE
  get("/insert_actor_record", { :controller => "actors", :action => "create" })

  # READ
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:the_actor_id", { :controller => "actors", :action => "show" })

  # Character routes

  # CREATE
  get("/insert_character_record", { :controller => "characters", :action => "create" })

  # READ
  get("/characters", { :controller => "characters", :action => "index" })
  get("/characters/:the_character_id", { :controller => "characters", :action => "show" })



  # ====== Routes for Admin Dashboard ==============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
