class Espense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups, join_table: 'groups_expenses'
end