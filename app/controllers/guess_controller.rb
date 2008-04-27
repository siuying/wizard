class GuessController < ApplicationController
  include ActsAsContinuable
  
  def_continued :guess do |x|
    @min = 1
    @max = 100
    @answer = rand(100) + 1
    render :partial => 'try' 
    continue
    
    begin
      @guess = params[:guess].to_i
      logger.debug "answer=#{@answer}, guess=#{@guess}"
      if @guess > @answer
        @msg = "The number is smaller than #{@guess}, try again!"
        @max = @guess if @max > @guess
      elsif @guess < @answer
        @msg = "The number is larger than #{@guess}, try again!"        
        @min = @guess if @min < @guess
      else
        break
      end
      render :partial => 'try'
      continue
    end until @guess == @answer

    render :partial => 'done'
    part3 
  end

  def index
    
  end
end
