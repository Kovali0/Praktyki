class Post < ActiveRecord::Base
    validates :title, :content, :author_id, presence: true
    validates :title, uniqueness: true
    validates :title, length: { maximum: 80}
    validates :content, length: { in: 20..500 }

    belongs_to :author
    #has_many :authorpost
    #has_many :author, through: :authorpost
    #has_many :comments, depend: :destroy

    scope :old, -> { where('created_at < ?', 40.minutes.ago) }

    #before_create :annotate_author

    #def annotate_author
    #    author = author + ' from Binarapps'
    #    author += ' from Binarapps'
    #    author = author.concat()
    #    self.author = "#{self.author} from Binnarapps"
    #end

    def fullpost
        "#{title} Author nr: #{author_id} #{content}"
    end
end 