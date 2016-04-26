class BoardGame < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :players, :manufacturer

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:players].empty? && !params[:manufacturer].empty?
  end
end