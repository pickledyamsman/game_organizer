class BoardGame < ActiveRecord::Base
  belongs_to :user

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:players].empty? && !params[:manufacturer].empty?
  end
end