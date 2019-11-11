class BeersQuery

  def self.call(params)
     @scope = Beer.all.includes(:beer_users)
     @scope = @scope.like_name(params[:name]) if params[:name].present?
     @scope = @scope.where(abv: params[:abv].to_f) if params[:abv].present?
     @scope
  end
end