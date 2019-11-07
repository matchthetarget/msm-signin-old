Rails.application.routes.draw do
  match("/", { :controller => "movies", :action => "index", :via => "get" })

  # Movie routes

  # CREATE
  match("/insert_movie_record", :controller => "movies", :action => "create", :via => "get")

  # READ
  match("/movies", :controller => "movies", :action => "index", :via => "get")
  match("/movies/last_decade", :controller => "movies", :action => "last_decade", :via => "get")
  match("/movies/long", :controller => "movies", :action => "long", :via => "get")
  match("/movies/short", :controller => "movies", :action => "short", :via => "get")
  
  match("/movies/:the_movie_id", :controller => "movies", :action => "show", :via => "get")
  match("/movies/:the_movie_id/director", :controller => "movies", :action => "director", :via => "get")
  match("/movies/:the_movie_id/characters", :controller => "movies", :action => "characters", :via => "get")
  match("/movies/:the_movie_id/cast", :controller => "movies", :action => "cast", :via => "get")

  # UPDATE
  match("/update_movie/:the_movie_id", :controller => "movies", :action => "update", :via => "get")

  # DELETE
  match("/delete_movie/:the_movie_id", :controller => "movies", :action => "destroy", :via => "get")
  

  
  # Director routes

  # CREATE
  match("/insert_director_record", :controller => "directors", :action => "create", :via => "get")

  # READ
  match("/directors", :controller => "directors", :action => "index", :via => "get")
  match("/directors/youngest", :controller => "directors", :action => "youngest", :via => "get")
  match("/directors/eldest", :controller => "directors", :action => "eldest", :via => "get")
  
  match("/directors/:the_director_id", :controller => "directors", :action => "show", :via => "get")
  match("/directors/:the_director_id/filmography", :controller => "directors", :action => "filmography", :via => "get")

  # UPDATE
  match("/update_director/:the_director_id", :controller => "directors", :action => "update", :via => "get")
  
  # DELETE
  match("/delete_director/:the_director_id", :controller => "directors", :action => "destroy", :via => "get")
  
  # Actor routes

  # CREATE
  match("/insert_actor_record", :controller => "actors", :action => "create", :via => "get")

  # READ
  match("/actors", :controller => "actors", :action => "index", :via => "get")

  match("/actors/:the_actor_id", :controller => "actors", :action => "show", :via => "get")
  match("/actors/:the_actor_id/filmography", :controller => "actors", :action => "filmography", :via => "get")
  match("/actors/:the_actor_id/characters", :controller => "actors", :action => "characters", :via => "get")

  # UPDATE
  match("/update_actor/:the_actor_id", :controller => "actors", :action => "update", :via => "get")

  # DELETE
  match("/delete_actor/:the_actor_id", :controller => "actors", :action => "destroy", :via => "get")

  # Character routes

  # CREATE
  match("/insert_character_record", :controller => "characters", :action => "create", :via => "get")

  # READ
  match("/characters", :controller => "characters", :action => "index", :via => "get")
  match("/characters/:the_character_id", :controller => "characters", :action => "show", :via => "get")

  # UPDATE
  match("/update_character/:the_character_id", :controller => "characters", :action => "update", :via => "get")

  # DELETE
  match("/delete_character/:the_character_id", :controller => "characters", :action => "destroy", :via => "get")


  # ====== Routes for Admin Dashboard ==============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
