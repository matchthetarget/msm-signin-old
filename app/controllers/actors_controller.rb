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

    actor.name = params.fetch(:input_name)
    actor.dob = params.fetch(:input_dob, nil)
    actor.bio = params.fetch(:input_bio, nil)
    actor.image = params.fetch(:input_image, nil)

    actor.save

    render({ :json => actor.as_json })
  end
end
