ActiveAdmin.register User do
  permit_params :nickname, :email, :avatar
  remove_filter :avatar_attachment, :avatar_blob
  actions :all, except: [:edit, :new]

  index do
    selectable_column
    id_column
    column :nickname
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :nickname
      row :email
      row :avatar do |user|
        image_tag(user.avatar, size: '300x200') if user.avatar.attached?
      end
    end
  end
end
