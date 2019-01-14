require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(email: "jeevarajmvsvg@gmail.com")}

  it "should be valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "should be not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

end
