require 'csv'
class CsvFile < ApplicationRecord
    mount_uploader :name, CsvUploader
    extend Enumerize

    include AASM

    STATUS_HASH = {pending: 3, finished: 2, fails: 1}

    enumerize :status, in: STATUS_HASH, default: :pending, predicates: true, scope: true, i18n_scope: "activerecord.attributes.csv_file/status"

    include CsvFileExtractAble


    def self.statuses
        STATUS_HASH.with_indifferent_access
    end
    
    aasm :status, column: :status, enum: true do
        state :pending, initial: true
        state :finished
        state :fails

        event :successful_extracted  do
          transitions from: :pending, to: :finished
        end

        event :failure_extracted  do
            transitions from: :pending, to: :fails
        end
    end



end
