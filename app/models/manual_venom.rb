class ManualVenom < ActiveRecord::Base

  scope :good, ->{where("manual_venoms.status IS NULL")}
  scope :flagged_for_review, ->{where("manual_venoms.status IS NOT NULL")}

  FLAGGED_FOR_REVIEW = "flagged_for_review"
  GOOD = "good"

  def display_name
    "#{id} - #{venom}"
  end

  def status?
    if self.status.nil? == true
      status_tag('good')
      ActiveAdmin::Views::StatusTag
    else
      ActiveAdmin::Views::StatusTag.new("FLAGGED FOR REIVEW", :error)
    end
  end
  
end
