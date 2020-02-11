class CharactersController < ApplicationController
  def index
    characters = Character.all.order({ :created_at => :asc })

    render({ :json => characters.as_json })
  end

  def show
    the_id = params.fetch(:the_character_id)
    character = Character.where({ :id => the_id }).at(0)

    render({ :json => character.as_json })
  end

  def create
    character = Character.new

    character.name = params.fetch(:input_name)
    character.actor_id = params.fetch(:input_actor_id)
    character.movie_id = params.fetch(:input_movie_id)

    character.save

    redirect_to("/movies/#{character.movie_id}")
  end
end
