require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:new_user_attributes) do
    {
        name: "BlocHead",
        email: "blochead@bloc.io",
        password: "blochead",
        password_confirmation: "blochead"
    }
  end

  describe "GET new" do
    it "should return http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should instantiate a new user" do
      get :new
      expect(assigns(:user)).to_not be_nil
    end
  end

  describe "POST create" do
    it "should return an http redirect" do
      post :create, user: new_user_attributes
      expect(response).to have_http_status(:redirect)
    end

    it "should create a new user" do
      expect{
        post :create, user: new_user_attributes
      }.to change(User, :count).by(1)
    end

    it "should set user name properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).name).to eq new_user_attributes[:name]
    end

    it "should set user email properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end

    it "should set user password properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).password).to eq new_user_attributes[:password]
    end

    it "should set user password_confirmation properly" do
      post :create, user: new_user_attributes
      expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
    end

    it "should log the user in after sign up" do
      post :create, user: new_user_attributes
      expect(session[:user_id]).to eq assigns(:user).id
    end

    describe "not signed in" do
      let(:factory_user) { create(:user) }

      before do
        post :create, user: new_user_attributes
      end

      it "should return http success" do
        get :show, {id: factory_user.id}
        expect(response).to have_http_status(:success)
      end

      it "should render the #show view" do
        get :show, {id: factory_user.id}
        expect(response).to render_template :show
      end

      it "should assign factory_user to @user" do
        get :show, {id: factory_user.id}
        expect(assigns(:user)).to eq(factory_user)
      end
    end
  end
end
