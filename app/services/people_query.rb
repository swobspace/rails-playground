class PeopleQuery
  attr_reader :search_options, :query

  ##
  # possible search options:
  # * :sn - string
  # * :givenname - string
  # * :username - string
  # * :birthdate - date
  # * :city - string
  # * :active - string
  # * :category - string
  # * :limit - limit result (integer)
  #
  # please note:
  #   .joins(:category)
  # must exist in relation
  #
  def initialize(relation, search_options = {})
    @relation       = relation
    @search_options = search_options.symbolize_keys
    @limit          = 0
    @query          ||= build_query
  end

  ##
  # get all matching activities
  def all
    query
  end

  ## 
  # iterate with block 
  def find_each(&block)
    query.find_each(&block)
  end

  ##
  def include?(ta)
    query.where(id: ta.id).limit(1).any?
  end

private
  attr_accessor :relation, :limit

  def build_query
    query = relation
    search_string = [] # for global search_option :search

    subtree = to_boolean(search_options.fetch(:subtree, false))

    search_value  = search_options.fetch(:search, false) # for global option :search
    search_options.each do |key,value|
      case key 
      when *string_fields
        query = query.where("people.#{key} LIKE ?", "%#{value}%")
      when :birthdate
        query = query.where("people.birthdate LIKE ?", "%#{value}%")
      when :category
        query = query.where("categories.name LIKE ?", "%#{value}%")
      when :active
        query = query.where(active: to_boolean(value))
      when :limit
        @limit = value.to_i
      when :search
        string_fields.each do |term|
          search_string << "people.#{term} LIKE :search"
        end
        search_string << "categories.name LIKE :search"
      else
        raise ArgumentError, "unknown search option #{key}"
      end
    end

    if search_value
      query = query.where(search_string.join(' or '), search: "%#{search_value}%")
    end

    if limit > 0
      query.limit(limit)
    else
      # Rails.logger.debug("DEBUG:: query #{query.to_sql}")
      query
    end
  end

private

  def string_fields
    [ :sn, :givenname, :username, :city ]
  end

  def to_boolean(value)
    return true if ['ja', 'true', '1', 'yes', 'on', 't'].include?(value.to_s.downcase)
    return false if ['nein', 'false', '0', 'no', 'off', 'f'].include?(value.to_s.downcase)
    return nil
  end

end
