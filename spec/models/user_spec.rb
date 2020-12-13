# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create(
      email: 'foo@bar.net',
      name: 'baz',
      password: 'chicken',
      password_confirmation: 'chicken'
    )
  end


end
