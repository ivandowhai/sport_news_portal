module Admin::StatusableHelper
  def status(model)
    statuses = {
      0 => {
        text: "Not published",
        class: "btn-info"
      },
      1 => {
        text: "Published",
        class: "btn-success"
      },
      2 => {
        text: "Closed",
        class: "btn-dark"
      }
    }
    statuses[model.status]
  end
end
