class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add(attribute, :email, options)
    end
  end
end
