class Hallucigif < ActiveRecord::Base
    validates :link, presence: true, :format => URI::regexp(%w(http https))

end