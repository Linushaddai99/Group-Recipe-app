require 'rails_helper'

RSpec.describe 'InventoriesController', type: :request do
  context 'get all inventories' do
    before(:example) {
      first_user = User.create(name:"Shaddai", email: 'shaddai@gmail.com', password: '12345678')
      first_inventory = Inventory.create(name:"First Inventory", user: first_user)
      get(inventories_path) 
    }

    it 'should display the correct placeholder' do
      expect(response.body).to include 'Inventories'
    end

    # it 'should have a status response of 200' do
    #   expect(response).to have_http_status(200)
    # end

    # it "renders 'index' template" do
    #   expect(response).to render_template('index')
    # end
  end

#   context 'Get #show for posts' do
#     before(:example) { get('/inventories/1') }
#     it 'should have a status response of 200' do
#       expect(response).to have_http_status(200)
#     end

#     it "renders 'show' template" do
#       expect(response).to render_template('show')
#     end

#     it 'should display the correct placeholder' do
#       expect(response.body).to include 'Add food'
#     end
#   end
end
