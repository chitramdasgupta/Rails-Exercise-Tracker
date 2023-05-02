class HomesController < ApplicationController
  skip_before_action :require_authorization, only: [:index, :about]
  def index
  end

  def about
  end
end
