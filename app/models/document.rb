require 'carrierwave/orm/activerecord'

class Document < ApplicationRecord
    mount_uploader :path, CsvUploader
end
