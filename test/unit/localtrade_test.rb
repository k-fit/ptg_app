# == Schema Information
#
# Table name: localtrades
#
#  id            :integer          not null, primary key
#  buy           :boolean
#  contract_type :string(255)
#  settlement    :string(255)
#  volume        :float
#  price         :float
#  broker        :string(255)
#  commission    :boolean
#  trader        :string(255)
#  user_id       :integer
#  trade_date    :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class LocaltradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
