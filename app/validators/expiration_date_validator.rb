class ExpirationDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && (value < DateTime.now)
      record.errors.add(attribute, " date/time cannot be in the past.")
    end
    
    if !value.present? || value.nil?
      record.errors.add(attribute, ' cannot be empty.')  
    end
   
    #The following seems unecessary/redundant since it appears Rails
    #will simply convert to nil any value you try to save into a date
    #field which is not a date.
    if value.present? && (!value.respond_to?(:strftime))
      record.errors.add(attribute, ' is not a valid date')
    end

  end
end