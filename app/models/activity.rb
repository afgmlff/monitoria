# frozen_string_literal: true

##
# Model de Activity (monitoria).
# Pertece a um usuário
# Precisa ter o campo de subject (disciplina)
# Em métodos com ações de create e update, é necessário a verificação do método check_date
class Activity < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true

  validate :check_date, on: %i[create update]
  ##
  # Permite atualização com base em decorrência real de um período (data final superior a data inicial)
  # Retorna "true" caso em caso de data final superior a data inicial ou retorna "false" caso contrário
  def check_date
    if start_date.nil? || end_date.nil? || (end_date < start_date)
      errors.add(:end_date, 'inválida')
      return false
    end
    true
  end
end
