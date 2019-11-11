require 'rails_helper'

RSpec.describe Beer, type: :model do
  it { is_expected.to validate_uniqueness_of :name }
end
