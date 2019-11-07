class ActorsController < ApplicationController
  def index
    actors = Actor.all.order({ :name => :asc })

    render({ :json => actors.as_json })
  end

  def show
    the_id = params.fetch(:the_actor_id)
    actor = Actor.where({ :id => the_id }).at(0)

    render({ :json => actor.as_json })
  end

  def create
    actor = Actor.new

    actor.name = params.fetch(:input_name, nil)
    actor.dob = params.fetch(:input_dob, nil)
    actor.bio = params.fetch(:input_bio, nil)
    actor.image = params.fetch(:input_image, nil)

    actor.save

    render({ :json => actor.as_json })
  end

  def update
    the_id = params.fetch(:the_actor_id)
    actor = Actor.where({ :id => the_id }).at(0)

    actor.name = params.fetch(:input_name, actor.name)
    actor.dob = params.fetch(:input_dob, actor.dob)
    actor.bio = params.fetch(:input_bio, actor.bio)
    actor.image = params.fetch(:input_image_url, actor.image)

    actor.save

    render({ :json => actor.as_json })
  end

  def destroy
    the_id = params.fetch(:the_actor_id)
    actor = Actor.where({ :id => the_id }).at(0)

    actor.destroy

    render({ :json => actor.as_json })
  end
  
  def filmography
    the_id = params.fetch(:the_actor_id)
    actor = Actor.where({ :id => the_id }).at(0)
    
    movies = actor.filmography.order({ :year => :asc })

    render({ :json => movies.as_json })
  end
  
  def characters
    the_id = params.fetch(:the_actor_id)
    actor = Actor.where({ :id => the_id }).at(0)

    the_characters = actor.characters.order({ :name => :asc })
    
    render({ :json => the_characters.as_json })
  end
end
