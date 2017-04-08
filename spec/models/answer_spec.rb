require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.new(title: "New Post Title", body: "New Post Body") }
  let(:answer) { Answer.new(body: 'Answer Body', question: question) }

  describe "attributes" do
    it "has a body attribute" do
      expect(answer).to respond_to(:body)
    end
  end
end
