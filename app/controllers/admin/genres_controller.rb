class Admin::GenresController < ApplicationController


  def index
   @genre = Genre.new
   @genres = Genre.all.page(params[:page]).per(10)
  end

  def create

  end

  def update

  end

  def edit

  end

end