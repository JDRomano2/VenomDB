class SmdbSearchVenomsController < ApplicationController

  def flag
    @venom = SmdbSearchVenom.find(params[:id])
    @venom.update_attribute(:status, true)
    
    #render :nothing => true
    redirect_to "/db/semantic_v_extractor_records/#{params[:id]}"
  end
  
end
