class Contact < ApplicationRecord
    belongs_to :category
    def self.search(term)
        if term
          where('name LIKE ?', "%#{term}%")
        else
          order('id DESC')
        end
      end
      
end