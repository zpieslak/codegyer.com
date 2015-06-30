ActiveAdmin.register Subscription do
  controller do
    def permitted_params
      params.permit(subscription: [:email])
    end
  end
end
