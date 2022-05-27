require 'action_view'
# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birthday    :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birthday, :name, :description, presence: true 
    validates :color, presence: true , inclusion: ['red','blue','pink','green','purple']
    validates :sex, presence: true, inclusion: ['M', 'F']

    def age 
        time_ago_in_words(self.birthday)

    end
end
