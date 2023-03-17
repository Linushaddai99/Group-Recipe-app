#require 'rails_helper'
#
#RSpec.describe 'Users', type: :request do
#    describe 'GET /index' do
#      before do
#        current_user = User.first
#    #    current_user.confirm if current_user.confirmed_at.nil?
#        sign_in current_user
#        get '/users'
#      end
#      it 'should return 200 status success code' do
#        expect(response).to have_http_status(:ok)
#      end
#      it 'check if it renders index template of the Users' do
#        expect(response).to render_template(:index)
#      end
#    end
#  end
