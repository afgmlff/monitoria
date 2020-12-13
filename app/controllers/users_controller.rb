# frozen_string_literal: true

class UsersController < ApplicationController
  ##
  # Ação index da classe User.
  # Renderiza a view index, que exibe todos os usuarios criados
  # GET /users
  def index
    # Lista todos os usuarios
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

  ##
  # Ação edit da classe User.
  # Renderiza página para edição de um usuario.
  # GET /users/:id/edit
  def edit
    # Solicita um id para saber qual dado será editado
    @user = User.find(params[:id])
  end

end
