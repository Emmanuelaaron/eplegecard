class Pledger < ApplicationRecord
    validates :name, :phonenumber, :amount, presence: true
end
