# frozen_string_literal: true

##
# Model de Disciplina.
# Pede para que o nome seja unico, e necessariamente preenchido
# pode ter varios monitores
class Discipline < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
