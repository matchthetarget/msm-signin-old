Rails.application.routes.draw do
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
