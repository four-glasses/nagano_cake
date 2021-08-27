class Public::HomesController < ApplicationController

  def top
    @newitems = Item.order(created_at: :desc).limit(4)
  end

  def about
  end

end
