require 'rails_helper'

RSpec.describe EntitiesController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/groups/1/entities/new').to route_to('entities#new', group_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/groups/1/entities/1/edit').to route_to('entities#edit', group_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/groups/1/entities').to route_to('entities#create', group_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/groups/1/entities/1').to route_to('entities#update', group_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/groups/1/entities/1').to route_to('entities#update', group_id: '1', id: '1')
    end
  end
end
