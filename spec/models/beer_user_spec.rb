require 'rails_helper'

RSpec.describe BeerUser, type: :model do
  subject { build(:beer_user) }
  #
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:beer) }
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_presence_of :time }

end
