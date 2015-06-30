ActiveAdmin.register Project do
  before_filter { @skip_sidebar = true }

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :short_content
      f.input :content
      f.input :features
      f.input :images_count
      f.input :date_at, as: :datepicker
    end
    f.buttons
  end

  controller do
    def permitted_params
      params.permit(project: [:name, :description, :short_content, :content, :features, :images_count, :date_at])
    end
  end
end
