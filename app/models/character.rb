# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer
#  movie_id   :integer
#

class Character < ApplicationRecord
  def actor
    return Actor.where({ :id => self.actor_id }).at(0)
  end
end
