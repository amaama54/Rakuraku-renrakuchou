class SearchsController < ApplicationController
  
  def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model, @content, @method)
  end
  
  private
  def search_for(model, content, method)
    if model == "teacher"
      if method == "perfect"
        Teacher.where(email: content)
      else
        Teacher.where("email LIKE ?", "%"+content+"%")
      end
    elsif model == "connection"
      if method == "perfect"
        Connection.where(title: content)
      else
        Connection.where("title LIKE ?", "%"+content+"%")
      end
    end
  end
end
