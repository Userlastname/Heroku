ActiveAdmin.register AdminUser do
  permit_params :email, :phone, :first_name, :last_name, :password, :password_confirmation

  index do
    selectable_column
    id_column

    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  filter :first_name
  filter :last_name
  filter :phone
  filter :category_id
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :phone
      f.input :category_id
      f.input :email
      f.input :password_confirmation
    end
    f.actions
  end

end
