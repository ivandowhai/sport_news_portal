module Admin::Concerns::Statusable
  extend ActiveSupport::Concern

  def publish
    if model.publish
      render json: model
    else
      render json: {error: "Failed to save."}, status: :bad_request
    end
  end

  def close
    if model.close
      render json: model
    else
      render json: {error: "Failed to save."}, status: :bad_request
    end
  end
end
