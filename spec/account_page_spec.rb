# frozen_string_literal: true

require_relative '../helpers/spec_helper'
require_relative '../models/model_factory'
require_relative '../page_objects/pages/account'
require_relative '../page_objects/pages/login'

describe 'Account' do
  let(:login) { Login.new(driver) }
  let(:account) { Account.new(driver) }
  let(:user) { ModelFactory.for('users')['registered user'] }

  before do
    login.visit
    login.log_as(user['username'], user['password'])
  end

  context 'with a login user on the account page' do
    it 'no accessibility errors are present on the page' do
      expect(account.page).to be_axe_clean
    end

    it 'no accessibility errors are present on the transaction history' do
      transaction_history = '.dash-tile.dash-tile-balloon.clearfix'
      expect(account.page).to be_axe_clean.within transaction_history
    end

    it 'no accessibility errors are present on the heading' do
      heading = '.maintext'
      expect(account.page).to be_axe_clean.within heading
    end
  end
end
