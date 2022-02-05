class PeopleDatatable < ApplicationDatatable

  def initialize(relation, view)
    @view = view
    @relation = relation
  end

  private
  attr_reader :relation

  def data
    people.map do |person|
      [].tap do |column|
        column << person.sn 
        column << person.givenname 
        column << person.username 
        column << person.birthdate 
        column << person.city 
        column << person.active 
        column << person.category 

        links = []
        links << show_link(person)
        links << edit_link(person)
        links << delete_link(person)
        column << links.join(' ')
      end
    end
  end

  def count
    @relation.count
  end

  def total_entries
    if params['length'] == "-1"
      Person.count
    else
      people_query.count
    end
  end

  def people
    @people ||= fetch_people
  end

  def people_query
    people = relation.order("#{sort_column} #{sort_direction}")
    people = PeopleQuery.new(people, search_params(params, search_columns)).all
  end

  def fetch_people
    if params['length'] == "-1"
      people = people_query
    else
      @pagy, people = pagy(people_query, page: page, items: per_page)
    end
    people
  end

  def columns
    %w[people.sn people.givenname people.username people.birthdate people.city
       people.active categories.name]
  end

  def search_columns
    %w[sn givenname username birthdate city active category]
  end
end
