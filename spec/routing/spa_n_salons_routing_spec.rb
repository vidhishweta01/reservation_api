# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpaNSalonsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/spa_n_salons').to route_to('spa_n_salons#index')
    end

    it 'routes to #show' do
      expect(get: '/spa_n_salons/1').to route_to('spa_n_salons#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/spa_n_salons').to route_to('spa_n_salons#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/spa_n_salons/1').to route_to('spa_n_salons#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/spa_n_salons/1').to route_to('spa_n_salons#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/spa_n_salons/1').to route_to('spa_n_salons#destroy', id: '1')
    end
  end
end
