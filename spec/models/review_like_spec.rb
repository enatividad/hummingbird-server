# rubocop:disable Metrics/LineLength
# == Schema Information
#
# Table name: review_likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  review_id  :integer          not null
#  user_id    :integer          not null
#
# Foreign Keys
#
#  fk_rails_2f5b7cb84c  (user_id => users.id)
#  fk_rails_e06d0d2851  (review_id => reviews.id)
#
# rubocop:enable Metrics/LineLength

require 'rails_helper'

RSpec.describe ReviewLike, type: :model do
  subject { build(:review_like) }
  it { should belong_to(:review) }
  it { should validate_presence_of(:review) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
end
