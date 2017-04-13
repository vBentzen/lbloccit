require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  let(:new_ad) do
    Advertisement.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: 50
    )
  end

  describe "Get #Index" do
    it "should return http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should assign [new_ad] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([new_ad])
    end
  end

  describe "Get #show" do
    it "should return http success" do
      get :show, {id: new_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "should render the #show view" do
      get :show, {id: new_ad.id}
      expect(response).to render_template :show
    end

    it "should assign new_ad to @post" do
      get :show, {id:new_ad.id}
      expect(assigns(:advertisement)).to eq(new_ad)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @ad" do
      get :new
      expect(assigns(:advertisements)).not_to be_nil
    end
  end

  describe "AD create" do
    it "increases the number of ads by 1" do
      expect{advertisement :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new ad to @advertisement" do
      advertisement :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      advertisement :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Advertisement.last
    end
  end

end
