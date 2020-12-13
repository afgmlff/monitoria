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
  
end
