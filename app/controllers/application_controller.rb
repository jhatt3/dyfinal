class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  private

 

  def categories
    @categories = Category.contact(:name)
  end



end
