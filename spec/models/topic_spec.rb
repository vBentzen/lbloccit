require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:public) { true }
  let(:topic) { create(:topic) }

  it { is_expected.to have_many(:posts) }

  describe "attributes" do
    it "should have name ,description and public attributes" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description, public: topic.public)
    end

    it "should be public by default" do
      expect(topic.public).to be(true)
    end
  end
end
