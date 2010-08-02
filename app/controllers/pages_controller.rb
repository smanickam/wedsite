class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def venue
    @title = "Venue"
  end

  def faq
    @title = "FAQ"
  end

end
