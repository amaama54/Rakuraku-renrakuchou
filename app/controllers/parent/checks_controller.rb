class Parent::ChecksController < ApplicationController
  before_action :authenticate_parent!,except: [:top]
  
  def index
  end
end
