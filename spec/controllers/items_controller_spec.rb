require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe '#index' do

    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  # describe '#edit' do
  #   it "render edit template" do
  #     get :edit
  #     expect(respond).to render_template(:edit)
  #   end
  # end

end
