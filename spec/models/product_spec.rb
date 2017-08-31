require 'rails_helper'

RSpec.describe Product, type: :model do
  before { @product = FactoryGirl.build(:product) }

  subject { @product }
  
  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should respond_to(:quantity) }
  
  it { should be_valid }
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:quantity) }
end
