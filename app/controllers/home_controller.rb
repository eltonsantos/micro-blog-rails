# Class HomeController
class HomeController < ApplicationController
  def index
    @posts = Post.limit(9).order('RANDOM()')
  end
end
