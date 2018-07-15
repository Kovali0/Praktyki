class Author < ActiveRecord::Base
    #has_many :authorpost
    #has_many :posts, through: :authorpost
    has_many :posts
    validates :name, presence: true, length: { in: 3..20}
    validates :surname, presence: true, length: { in: 3..20}
    validates :age, numericality: { only_integer: true }, length: {maximum: 3}

    scope :old, -> { where('age > 30') }
    scope :young, -> { where('age < 20') }

    before_validation :default_age #zajebiaszcza akcja, zapisuje omijając validacje i wstawiam automatycznie do age: nil -> age:25

    def fullname
        "#{name} #{surname}"
    end

    private

    def default_age
        self.age = 25 unless age
    end
end
