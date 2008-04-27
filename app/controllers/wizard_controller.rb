class WizardController < ApplicationController
  include ActsAsContinuable
  
  def_continued :wizard do |x|
    render :partial => 'part_1'
    continue
    
    @name = params[:name]
    render :partial => 'part_2'
    continue

    @msg = params[:msg]
    render :partial => 'part_3'
  end

  def index
    
  end

end