ActiveAdmin.register Message do
  controller do
    def permitted_params
      params.permit(:message => [:name, :email, :content])
    end
  end
end
