class SmdbSearchVenom < ActiveRecord::Base

  def display_name
    "#{id} - #{compound}"
  end
end
