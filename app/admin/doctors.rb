ActiveAdmin.register Doctor do
  permit_params :email, :phone, :first_name, :last_name, :category_id, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :phone
    column :category_id, ->(user) { Category.find_by(id: user.category_id)&.name }
    column :email
    column :created_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :phone
  filter :category_id
  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_name, :last_name, :category_id, :phone, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :category_id, :phone, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
