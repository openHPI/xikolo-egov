# frozen_string_literal: true

require 'spec_helper'

describe 'Sessions: Create with User ID', type: :request do
  subject(:resource) { api.rel(:sessions).post(payload).value! }

  let(:api) { Restify.new(:test).get.value! }
  let(:user) { create(:user) }

  let(:response) do
    resource.response
  rescue Restify::ClientError, Restify::ServerError => e
    e.response
  end

  describe 'POST /sessions with eGov Campus provider' do
    let(:payload) { {authorization: authorization.id} }

    let(:authorization) do
      create(:authorization, user: nil, provider:, info:, uid:)
    end

    let(:email) { attributes_for(:email)[:address] }

    let(:uid) { '1' }
    let(:provider) { 'egovcampus' }
    let(:info) do
      {
        name: 'John Doe',
        email:,
      }
    end

    let(:full_name) { 'John Doe' }

    it_behaves_like 'an authorization provider'
  end
end
