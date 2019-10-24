ActiveAdmin.register User do
  permit_params :nickname, :email, :avatar

  index do
    selectable_column
    id_column
    column :nickname
    column :email
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :nickname
      f.input :email
      f.input :avatar, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :nickname
      row :email
      row :avatar do |user|
        image_tag(user.avatar, size: '300x200')
      end
    end
  end
end
