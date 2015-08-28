class ManualVenomsController < ApplicationController

  def update
  end

  def flag
    @venom = ManualVenom.find(params[:id])
    @venom.update_attribute(:status, true)
    
    #render :nothing => true
    redirect_to "/db/manually_curated_venoms/#{params[:id]}"
  end
  
end
