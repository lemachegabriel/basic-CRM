class Prospect < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :stage, optional: true
end
