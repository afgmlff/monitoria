# frozen_string_literal: true

##
# Model de User.
# Pede para que o nome seja unico, e necessariamente preenchido
# Pede para que o nome seja preenchido
# Precisa ter uma desses três tipos de usuários
# Administrado, tutor ou aluno

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  enum role: { administrator: 0, tutor: 1, aluno: 2 }
end
