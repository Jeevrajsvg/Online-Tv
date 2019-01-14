require 'rails_helper'

RSpec.describe Season, type: :model do
  subject {
    described_class.new(title: "Jack Ryan", plot: "Ryan as an up-and-coming CIA analyst")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a plot" do
    subject.plot = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a title and plot" do
    subject.title = nil
    subject.plot = nil
    expect(subject).to_not be_valid
  end

end
