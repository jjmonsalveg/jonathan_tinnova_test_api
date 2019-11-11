class BeersQuery

  def self.call(params)
     @scope = Beer.all
     @scope = @scope.like_name(params[:name]) if params[:name].present?
     @scope
  end
end