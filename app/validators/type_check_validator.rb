class TypeCheckValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value.present? && Listing.subclasses.include?(value.safe_constantize)
          record.errors.add(attribute, "  is unknown type.")
      end
    end
end