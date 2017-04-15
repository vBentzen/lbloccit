require 'rails_helper'

RSpec.describe Question, type: :model do
let(:question) {Question.new(title: 'what', body: 'Body Text', resolved: false)}
  describe 'have attributes' do
    it 'should respond to :title, :body, :resolved' do
      expect(question).to respond_to(:title, :body, :resolved)
    end
  end
end
