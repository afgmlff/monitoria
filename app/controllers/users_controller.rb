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

  ##
  # Método responsável por atualizar um registro com os dados inseridos em Edit.
  # Recebe os dados da view Edit e faz o tratamento dos dados modificados pelo usuário.
  # Caso os dados sejam válidos, o registro é atualizado no banco, caso não sejam, não salva
  # Redireciona para a página Index
  # PATCH/PUT /users/:id
  def update
    # Encontra o usuario com o id passado como parâmetro
    @user = User.find(params[:id])
    # Se os dados passados atendem os requisitos estipulados na Model
    begin
      @user.update(user_params)
      # É renderizado para Index do usuario com uma mensagem de sucesso
      flash[:notice] = 'Usuario atualizada com sucesso'
    rescue StandardError => e
      # Se não foi possivel fazer update, é renderizado para Index do usuario com uma mensagem de erro
      flash[:notice] = e
    end
    redirect_to users_path
  end

  ##
  # Método responsável por excluir um registro salvo na tabela.
  # Redireciona para a view index.
  # DELETE /users/:id
  def destroy
    # Encontra o usuario com o id passado como parâmetro
    @user = User.find(params[:id])
    begin
      # Se foi possivel apagar o dado, retrona uma mensagem de sucesso
      @user.destroy!
      flash[:notice] = 'Usuário apagado com sucesso'
    ensure
      # É renderizado para Index dos usuários
      redirect_to users_path
    end
  end

  private

  ##
  # Parametros utilizados para criar ou editar os usuarios
  def user_params
    # Requer um nome para tabela
    params.require(:user).permit(:role)
  end
end
