# == Schema Information
#
# Table name: reviews
#
#  id                :integer          not null, primary key
#  content           :text             not null
#  content_formatted :text             not null
#  legacy            :boolean          default(FALSE), not null
#  likes_count       :integer          default(0)
#  media_type        :string
#  progress          :integer
#  rating            :integer          not null
#  source            :string(255)
#  summary           :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  library_entry_id  :integer
#  media_id          :integer          not null, indexed
#  user_id           :integer          not null, indexed
#
# Indexes
#
#  index_reviews_on_media_id  (media_id)
#  index_reviews_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_150e554f22  (library_entry_id => library_entries.id)
#

require 'rails_helper'

RSpec.describe Review, type: :model do
  subject { build(:review) }
  it { should have_many(:likes).class_name('ReviewLike') }
  it { should belong_to(:media) }
  it { should validate_presence_of(:media) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
  it { should belong_to(:library_entry) }
  it { should validate_presence_of(:library_entry) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:summary) }
end
