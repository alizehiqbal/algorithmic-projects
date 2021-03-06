class Vertex
  attr_accessor :value, :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex
  attr_reader :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @from_vertex.out_edges.push(self)
    @to_vertex = to_vertex
    @to_vertex.in_edges.push(self)
    @cost = cost
  end

  def destroy!
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex, @to_vertex = nil, nil
  end
end
