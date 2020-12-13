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

  ##
  # GET /activity/:id
  # Demonstração em detalhes os dados de um registro anteriormente criado
  # para visualização
  def show
    # De acordo com o id passado pelo usuário (quando clica na monitoria) as informações são atualizadas
    @activity = Activity.find(params[:id])
  end

  ##
  # Ação new da classe Activity.
  # Renderiza página para criação de uma monitoria.
  # GET /activities/new
  def new
    # Renderiza uma página para inserção de dados
    @activity = Activity.new
  end


end
