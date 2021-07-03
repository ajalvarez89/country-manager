# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tasks', type: :request do
  let(:user) { create :user }
  before(:each) { sign_in user }

  describe 'GET /countries' do
    it 'is redirect to countries index' do
      get countries_path
      expect(response).to have_http_status(200)
    end
  end
end
