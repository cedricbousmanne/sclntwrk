class DomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "must be a valid URL") unless url_valid?(value)
  end

  # a URL may be technically well-formed but may
  # not actually be valid, so this checks for both.
  def url_valid?(domain)
    return unless domain
    domain.match(/^([a-zA-Z\-])+(\.([a-zA-Z\-])+)+$/)
  end
end