class Contact < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    return "#{address}, #{city}, #{state}"
  end

    belongs_to :category
    def self.search(term)
        if term
          where('name LIKE ?', "%#{term}%")
        else
          order('id DESC')
        end
    end
      
end