class ManualVenom < ActiveRecord::Base

  def display_name
    "#{id} - #{venom}"
  end
end
