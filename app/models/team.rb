# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
end
