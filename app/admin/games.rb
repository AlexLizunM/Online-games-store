ActiveAdmin.register Game do
  permit_params :name, :price, :cover

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :cover do |game|
      url_for(game.cover)
    end
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :cover, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :cover do |game|
        image_tag(game.cover, size: '300x200')
      end
    end
  end
end
