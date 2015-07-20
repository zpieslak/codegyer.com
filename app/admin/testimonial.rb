ActiveAdmin.register Testimonial do
  controller do
    def permitted_params
      params.permit(testimonial: [:content, :author, :company, :position])
    end
  end
end
