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


  ##
  # Método responsável por criar um registro com os dados inseridos pelo método New.
  # Recebe os dados da view new e faz o tratamento para decidir se o registro é válido ou não.
  # Redireciona para a página Index
  # POST /activities
  def create
    @disciplines = Discipline.all
    # Salva os parametros digitados pelo usuário
    @activity = Activity.new(activitie_params)
    begin
      # Se foi possivel salva os dados no banco, aparece uma mensagem de sucesso
      @activity.save!
      flash[:notice] = 'Monitoria criado com sucesso'
    rescue StandardError => e
      # Se não foi possivel salvar, aparece uma mensagem de erro
      flash[:notice] = e
    ensure
      # Independente se ocorreu ou não excessão, o usuário é redirecionado para Index da diciplina
      redirect_to activities_path
    end
  end

  ##
  # Ação edit da classe Activity.
  # Renderiza página para edição de uma monitoria.
  # GET /activities/:id/edit
  def edit
    # Solicita um id para saber qual dado será editado
    @activity = Activity.find(params[:id])
  end

  ##
  # Método responsável por atualizar um registro com os dados inseridos em Edit.
  # Recebe os dados da view Edit e faz o tratamento dos dados modificados pelo usuário.
  # Caso os dados sejam válidos, o registro é atualizado no banco, caso não sejam, não salva
  # Redireciona para a página Index
  # PATCH/PUT /activities/:id
  def update
    # Encontra a monitoria com o id passado como parâmetro
    @activity = Activity.find(params[:id])
    # Se os dados passados atendem os requisitos estipulados na Model
    if @activity.update(activitie_params)
      # É renderizado para Index da monitoria com uma mensagem de sucesso
      flash[:notice] = 'Monitoria atualizada com sucesso'
      redirect_to activities_path
    else
      # Se não foi possivel fazer update, é renderizado para Index da monitoria com uma mensagem de erro
      flash[:notice] = 'Não foi possivel editar'
      redirect_to activities_path
    end
  end

  ##
  # Método responsável por excluir um registro salvo na tabela.
  # Redireciona para a view index.
  # DELETE /activities/:id
  def destroy
    # Encontra a monitoria com o id passado como parâmetro
    @activity = Activity.find(params[:id])
    begin
      # Se foi possivel apagar o dado, retrona uma mensagem de sucesso
      @activity.destroy!
      flash[:notice] = 'Monitoria apagada com sucesso'
    rescue StandardError => e
      # Se não foi possivel apagar, aparece uma mensagem de erro
      flash[:notice] = e
    ensure
      # É renderizado para Index das monitoria
      redirect_to activities_path
    end
  end


  private

  ##
  # Parametros utilizados para criar ou editar as monitorias
  def activitie_params
    # Requer um nome para tabela
    params.require(:activity).permit(:user_id, :subject, :start_date, :end_date, :status)
  end

end
