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

  ##
  # GET /user/:id
  # Demonstração em detalhes os dados de um registro anteriormente criado
  # para visualização
  def show
    # De acordo com o id passado pelo usuário (quando clica no usuário) as informações são atualizadas
    @user = User.find(params[:id])
  end

end
