require 'rails_helper'

RSpec.describe Episode, type: :model do

  let (:season) {Season.create!(:title => 'Jack Ryan',plot:"Ryan as an up-and-coming CIA analyst")}
  subject {
    described_class.new(title: "Episode 1", plot: "The Episode",season_id: season.id,number: 1)}

  it "should be valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "should be not valid without a User" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "should be not valid without a order_type" do
    subject.plot = nil
    expect(subject).to_not be_valid
  end

  it "should be not valid without a title,plot,season_id" do
    subject.title = nil
    subject.plot = nil
    subject.season_id = nil
    expect(subject).to_not be_valid
  end
end
