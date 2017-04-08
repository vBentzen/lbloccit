require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: false) }

  describe "attributes" do
    it "has title attribute" do
      expect(question).to respond_to(:title)
    end
    it "has body attribute" do
      expect(question).to respond_to(:body)
    end
    it "has resolved attribute" do
      expect(question).to respond_to(:resolved)
    end
  end
  #Could also be done like this :
  #describe "attributes" do
  #  it "has title, body and resolved attributes" do
  #    expect(question).to have_attributes(title: "New Question Title", body: "New Question Body", resolved: false)
  #  end
  #end
end
