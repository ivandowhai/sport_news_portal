class Admin::LocalesController < Admin::AdminController
  def index
    @locales = Locale.all
  end

  def create
    locale = Locale.new(locale_params)
    if locale.save
      redirect_to admin_locales_path locale, notice: "Locale was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def enable
    if locale.enable
      render json: locale
    else
      render json: {error: "Failed to save."}, status: :bad_request
    end
  end

  def disable
    if locale.disable
      render json: locale
    else
      render json: {error: "Failed to save."}, status: :bad_request
    end
  end

  def destroy
    unless locale.is_default?
      locale.destroy
    end

    redirect_to admin_locales_path
  end

  private

  def locale
    @locale ||= Locale.find(params[:id])
  end

  def locale_params
    params.require(:locale).permit(:code)
  end
end
