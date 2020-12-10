class ActivitiesController < ApplicationController
  before_action :require_tutor, only: [:index]
  def index
    @act = Activity.all
  end
end
