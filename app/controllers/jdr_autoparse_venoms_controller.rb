class JdrAutoparseVenomsController < ApplicationController

  def flag
    @venom = JdrAutoparseVenom.find(params[:id])
    @venom.update_attribute(:status, true)
    
    #render :nothing => true
    redirect_to "/db/v_extractor_records/#{params[:id]}"
  end
  
end
