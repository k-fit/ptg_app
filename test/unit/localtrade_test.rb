# == Schema Information
#
# Table name: localtrades
#
#  id                :integer          not null, primary key
#  buy               :integer
#  content_type      :string(255)
#  settlement_period :string(255)
#  price             :float
#  volume            :float
#  broker            :string(255)
#  trader            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class LocaltradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
