class CustomSet
  attr_reader :collection
  
  def initialize(array = [])
    @collection = array
  end

  def empty?
    @collection.empty?
  end

  def contains?(obj)
    @collection.include?(obj)
  end

  def subset?(other_custom_set)
    (self.collection - other_custom_set.collection).empty?
  end

  def disjoint?(other_custom_set)
    self.collection.none? {|element| other_custom_set.contains?(element)}
  end

  def eql?(other_custom_set)
    self.collection.uniq.sort == other_custom_set.collection.uniq.sort
  end

  def add(obj)
    @collection << obj
    self
  end

  def ==(other_custom_set)
    self.eql?(other_custom_set)
  end

  def intersection(other_custom_set)
    common_elements = self.collection.select {|obj| other_custom_set.contains?(obj)}
    CustomSet.new(common_elements)
  end

  def difference(other_custom_set)
    CustomSet.new(self.collection - other_custom_set.collection)
  end

  def union(other_custom_set)
    CustomSet.new((self.collection + other_custom_set.collection).uniq)
  end
end
