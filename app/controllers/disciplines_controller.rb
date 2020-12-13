##
# Implementação da controller de Disciplinas
# Função: definir métodos estruturais para listagem, criação, inserção de dados,
# edição de um registro e remoção de um registro
# frozen_string_literal: true

class DisciplinesController < ApplicationController
  ##
  # Para acessar a área de diclipnas precisa ser um tutor ou administrador
  # before_action :require_tutor

  ##
  # Ação index da classe Discipline.
  # Renderiza a view index, que exibe todas as diciplinas criadas
  # GET /discipline
  def index
    # Lista todas as diciplinas
    @disciplines = Discipline.all
  end

  ##
  # Ação new da classe Discipline.
  # Renderiza página para criação de uma diciplina.
  # GET /disciplines/new
  def new
    # Renderiza uma página para inserção de dados
    @discipline = Discipline.new
  end

  ##
  # Método responsável por criar um registro com os dados inseridos pelo método New.
  # Recebe os dados da view new e faz o tratamento para decidir se o registro é válido ou não.
  # Redireciona para a página Index
  # POST /disciplines
  def create
    # Salva os parametros digitados pelo usuário
    @discipline = Discipline.new(discipline_params)
    begin
      # Se foi possivel salva os dados no banco, aparece uma mensagem de sucesso
      @discipline.save!
      flash[:notice] = "Disciplina #{@discipline.name} criado com sucesso"
    rescue StandardError => e
      # Se não foi possivel salvar, aparece uma mensagem de erro
      flash[:notice] = e
    ensure
      # Independente se ocorreu ou não excessão, o usuário é redirecionado para Index da diciplina
      redirect_to disciplines_path
    end
  end

  ##
  # Ação edit da classe Discipline.
  # Renderiza página para edição de uma diciplina.
  # GET /disciplines/:id/edit
  def edit
    # Solicita um id para saber qual dado será editado
    @discipline = Discipline.find(params[:id])
  end

  ##
  # Método responsável por atualizar um registro com os dados inseridos em Edit.
  # Recebe os dados da view Edit e faz o tratamento dos dados modificados pelo usuário.
  # Caso os dados sejam válidos, o registro é atualizado no banco
  # Redireciona para a página Index
  # PATCH/PUT /disciplines/:id
  def update
    # Encontra a diciplina com o id passado como parâmetro
    @discipline = Discipline.find(params[:id])
    # Se os dados passados atendem os requisitos estipulados na Model
    if @discipline.update(discipline_params)
      # É renderizado para Index da disciplina com uma mensagem de sucesso
      flash[:notice] = "Disciplina #{@discipline.name} atualizada com sucesso"
    else
      # Se não foi possivel fazer update, é renderizado para Index da disciplina com uma mensagem de erro
      flash[:notice] = 'Não foi possivel editar'
    end
    redirect_to disciplines_path
  end

  ##
  # Método responsável por excluir um registro salvo na tabela.
  # Redireciona para a view index.
  # DELETE /disciplines/:id
  def destroy
    # Encontra a diciplina com o id passado como parâmetro
    @discipline = Discipline.find(params[:id])
    begin
      # Se foi possivel apagar o dado, retrona uma mensagem de sucesso
      @discipline.destroy!
      flash[:notice] = "Disciplina #{@discipline.name} apagada com sucesso"
    rescue StandardError => e
      # Se não foi possivel apagar, aparece uma mensagem de erro
      flash[:notice] = e
    ensure
      # É renderizado para Index das diciplinas
      redirect_to disciplines_path
    end
  end

  private

  ##
  # Parametros utilizados para criar ou editar diciplinas
  def discipline_params
    # Requer um nome para tabela
    params.require(:discipline).permit(:name)
  end
end
