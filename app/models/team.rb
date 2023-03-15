# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
