class IndexController < ApplicationController

  layout :false

  def index
    @jscode = JSGenerator.generate
    respond_to do |format|
      format.js { render file: 'app/views/layouts/javascript' }
    end
  end

end
