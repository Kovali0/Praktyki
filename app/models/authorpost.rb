class AuthorPost < ActiveRecord::Base
    belong_to :author
    belong_to :post
end