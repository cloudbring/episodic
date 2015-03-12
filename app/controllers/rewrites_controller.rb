class RewritesController < ApplicationController
  def index
    @rewrites = Rewrite.all
  end

  def new
    @rewrites = Rewrite.new(rewrite_params)
  end

  def create
    
  end

  def update
    
  end

  def delete
    
  end
end