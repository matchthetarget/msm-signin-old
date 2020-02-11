class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order({ :created_at => :desc })
    
    render({ :template => "movie_templates/index.html.erb" })
  end
  
  def show
    the_id = params.fetch(:the_movie_id)
    @movie = Movie.where({ :id => the_id }).at(0)

    render({ :template => "movie_templates/show.html.erb" })
  end
  
  def create
    movie = Movie.new

    movie.title = params.fetch(:input_title)
    movie.description = params.fetch(:input_description)
    movie.year = params.fetch(:input_year)
    movie.duration = params.fetch(:input_duration)
    movie.image = params.fetch(:input_image_url)
    movie.director_id = params.fetch(:input_director_id)

    movie.save
    
    redirect_to("/movies")
  end
  
  def update
    the_id = params.fetch(:the_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    movie.title = params.fetch(:input_title)
    movie.year = params.fetch(:input_year)
    movie.duration = params.fetch(:input_duration)
    movie.image = params.fetch(:input_image_url)
    movie.director_id = params.fetch(:input_director_id)

    movie.save

    redirect_to("/movies/#{movie.id}")
  end
  
  def destroy
    the_id = params.fetch(:the_movie_id)
    movie = Movie.where({ :id => the_id }).at(0)

    movie.destroy
    
    redirect_to("/movies", { :notice => "Deleted #{movie.title}." })
  end

  def last_decade
    @movies = Movie.last_decade.order({ :year => :desc })

    
    render({ :template => "movie_templates/recent.html.erb" })
  end
 
  def long
    @movies = Movie.long.order({ :duration => :desc })

    render({ :template => "movie_templates/long.html.erb" })
  end
 
  def short
    @movies = Movie.short.order({ :duration => :asc })

    render({ :template => "movie_templates/short.html.erb" })
  end
end
