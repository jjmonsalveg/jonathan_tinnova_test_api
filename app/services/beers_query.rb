class BeersQuery

  def self.call(params)
     @scope = Beer.all
  end
end