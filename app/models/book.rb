class Book < ApplicationRecord
  # Callbacks to add each new created book to the start of the books list
  # and update the likes count on each like button click
  after_create_commit { broadcast_prepend_to :books }
  after_update_commit { broadcast_replace_to "book_#{id}".to_sym }

  validates :title, :description, presence: true
end
