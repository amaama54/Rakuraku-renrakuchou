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
        flash[:notice] = "先生の部分検索はできません！"
        redirect_to connections_path
      end
    elsif model == "connection"
      if method == "perfect"
        @current_time = Time.current
        Connection.where(title: content)
      else
        @current_time = Time.current
        Connection.where("title LIKE ?", "%"+content+"%")
      end
    end
  end
end
