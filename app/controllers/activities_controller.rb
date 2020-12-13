# frozen_string_literal: true

class ActivitiesController < ApplicationController
  ##
  # Ação index da classe Activity.
  # Renderiza a view index, que exibe todas as monitorias criadas
  # GET /activities
  def index
    # Lista todas as monitorias
    @activities = Activity.all
  end
end
