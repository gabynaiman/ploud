class Enum

  def self.with_values(values)
    cattr_accessor :values
    self.values = values
  end

  def self.all_values
    self.values
  end

  def self.all
    self.values.map { |e| new(e) }
  end

  def self.to_select_list
    all.map { |e| [e.name, e.id] }
  end

  attr_reader :id

  def initialize(id)
    raise "Invalid id: #{id}" unless self.class.all_values.include? id
    @id = id
  end

  def name
    if id.length > 1
      I18n.t("activerecord.constants.#{self.class.to_s.pluralize.underscore}.#{id}")
    else
      id
    end
  end

end
