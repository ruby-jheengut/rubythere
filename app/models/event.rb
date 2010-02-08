# == Schema Information
# Schema version: 20100208172043
#
# Table name: events
#
#  id                    :integer(4)      not null, primary key
#  name                  :string(255)
#  url                   :string(255)
#  description           :text
#  description_formatted :text
#  start_date            :datetime
#  end_date              :datetime
#  cfp_date              :datetime
#  reg_open_date         :datetime
#  proposal_close_date   :datetime
#  cost                  :decimal(10, 2)  default(0.0)
#  currency              :string(255)
#  sold_out              :boolean(1)
#  childcare             :boolean(1)
#  created_at            :datetime
#  updated_at            :datetime
#  location_id           :integer(4)
#

class Event < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :name, :message => '^Please add a name'
end
