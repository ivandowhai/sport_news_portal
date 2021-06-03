module Admin::StatusableHelper
  def status(model)
    statuses = {
      pending: {
        text: "Not published",
        class: "btn-info"
      },
      published: {
        text: "Published",
        class: "btn-success"
      },
      closed: {
        text: "Closed",
        class: "btn-dark"
      }
    }
    statuses[model.status.to_sym]
  end
end
