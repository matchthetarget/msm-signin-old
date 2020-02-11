class DirectorsController < ApplicationController
  def index
    directors = Director.all.order({ :name => :asc })

    render({ :json => directors.as_json })
  end

  def show
    the_id = params.fetch(:the_director_id)
    director = Director.where({ :id => the_id }).at(0)

    render({ :json => director.as_json })
  end

  def create
    director = Director.new

    director.name = params.fetch(:input_name)
    director.dob = params.fetch(:input_dob, nil)
    director.bio = params.fetch(:input_bio, nil)
    director.image = params.fetch(:input_image_url, nil)

    director.save

    render({ :json => director.as_json })
  end
end
