class DepartmentsQuery
  attr_reader :relation

  def initialize(relation = Department.all)
    @relation = relation
  end

  def search(query)
    return self unless query.present?

    query = query.downcase
    @relation = relation.where('lower(name) LIKE ?', "%#{query}%")
    self
  end

  def sort(field, direction)
    case field
    when 'name'
      @relation = relation.order("name #{direction}")
    when 'created_at'
      @relation = relation.order("created_at #{direction}")
    else
      @relation = relation.order(:id)
    end
    self
  end

  def result
    @relation
  end
end
