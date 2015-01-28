class ExperimentsController < InheritedResources::Base

  before_action :authenticate

  def permitted_params
    params.permit(:experiment => [:title, :status, :published_until, :country_code])
  end

end
