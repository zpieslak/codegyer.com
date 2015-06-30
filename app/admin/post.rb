ActiveAdmin.register Post do
  form do |f|
    f.inputs do
      f.input :title
      f.input :content
    end
    f.buttons
  end

  controller do
    def permitted_params
      params.permit(post: [:title, :content])
    end
  end
end
