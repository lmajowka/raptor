class ChangesController < InheritedResources::Base

  before_action :authenticate
  skip_before_filter :verify_authenticity_token

  def permitted_params
    params.permit(:change => [:content, :selector, :css_text, :variation_id])
  end

  def create
    create!{
      unless @change.errors.any?
        back_to_experiment and return
      else
        render 'new' and return
      end
    }
  end

  def destroy
    destroy!{back_to_experiment and return}
  end

  private

  def back_to_experiment
    redirect_to @change.variation.experiment
  end

end