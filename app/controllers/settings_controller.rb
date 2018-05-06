class SettingsController < ApplicationController

  def edit
    @setting = current_admin.setting
  end

  def update
    @setting = current_admin.setting
    if @setting.update(setting_params)
      flash[:notice] = "Done! setting #{@setting.auto_text} was updated"
      redirect_to "/"
    else
      flash[:warning] = "#{@setting.errors.full_messages}"
      render :edit
    end
  end

  private 
  def setting_params
    params.require(:setting).permit(:auto_text)
  end

end
