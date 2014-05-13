class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def render_create(model)
    respond_to do |format|
      if model.save
        format.html { redirect_to model, notice: "#{model.class.model_name.titleize} was successfully created." }
        format.json { render json: model, status: :created, location: model }
      else
        format.html { render action: "new" }
        format.json { render json: model.errors, status: :unprocessable_entity }
      end
    end
  end

  def render_update(model, params)
    respond_to do |format|
      if model.update_attributes(params)
        format.html { redirect_to model, notice: "#{model.class.model_name.titleize} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: model.errors, status: :unprocessable_entity }
      end
    end
end
