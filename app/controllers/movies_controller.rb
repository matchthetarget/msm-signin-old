class MoviesController < ApplicationController
  def index
    movies = Movie.all.order({ :year => :asc })
    
    render({ :json => movies.as_json })
  end
  
  def show
    the_id = params.fetch(:the_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    render({ :json => movie.as_json })
  end
  
  def create
    movie = Movie.new

    movie.title = params.fetch(:input_title, nil)
    movie.year = params.fetch(:input_year, nil)
    movie.duration = params.fetch(:input_duration, nil)
    movie.image = params.fetch(:input_image_url, nil)
    movie.director_id = params.fetch(:input_director_id, nil)

    movie.save
    
    render({ :json => movie.as_json })
  end
  
  def update
    the_id = params.fetch(:the_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    movie.title = params.fetch(:input_title, movie.title)
    movie.year = params.fetch(:input_year, movie.year)
    movie.duration = params.fetch(:input_duration, movie.duration)
    movie.image = params.fetch(:input_image_url, movie.image)
    movie.director_id = params.fetch(:input_director_id, movie.director_id)

    movie.save

    render({ :json => movie.as_json })
  end
  
  def destroy
    the_id = params.fetch(:the_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    movie.destroy
    
    render({ :json => movie.as_json })
  end

  def last_decade
    movies = Movie.last_decade.order({ :year => :desc })

    render({ :json => Movie.last_decade.as_json })
  end
 
  def long
    movies = Movie.long.order({ :duration => :desc })

    render({ :json => movies.as_json })
  end
 
  def short
    movies = Movie.short.order({ :duration => :asc })

    render({ :json => movies.as_json })
  end
 
  def director
    the_id = params.fetch(:the_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    the_director = movie.director

    render({ :json => the_director.as_json })
  end
 
  def characters
    the_id = params.fetch(:the_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)
    
    the_characters = movie.characters

    render({ :json => the_characters.as_json })
  end
  
  def cast
    the_id = params.fetch(:the_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    actors = movie.cast

    render({ :json => actors.as_json })
  end
end
