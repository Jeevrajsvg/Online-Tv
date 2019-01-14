require 'rails_helper'

RSpec.describe OrderDetail, type: :model do

  let (:user) {User.create!(:email => 'jeevarajmvsvg@gmail.com')}
  let (:movie) {Movie.create!(:title => 'The Avengers',plot:"The super hero movie")}
  subject {
    described_class.new(user_id: user.id, order_type: "Movie",order_id: movie.id,price: 30.00,quality: "HD")}

  it "should be valid with valid attributes" do
      expect(subject).to be_valid
  end

  it "should be not valid without a User" do
      subject.user_id = nil
      expect(subject).to_not be_valid
  end

  it "should be not valid without a order_type" do
      subject.order_type = nil
      expect(subject).to_not be_valid
  end

  it "should be not valid without a user_id,order_id and order_type" do
      subject.user_id = nil
      subject.order_type = nil
      subject.order_id = nil
      expect(subject).to_not be_valid
  end
end
