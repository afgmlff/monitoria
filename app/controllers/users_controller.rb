# frozen_string_literal: true

class UsersController < ApplicationController
  ##
  # Ação index da classe User.
  # Renderiza a view index, que exibe todas as monitorias criadas
  # GET /users
  def index
    # Lista todas as monitorias
    @users = User.all
  end


end
