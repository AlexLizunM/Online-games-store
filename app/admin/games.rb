ActiveAdmin.register Game do
  permit_params :name, :price, :cover, :description, :tag_list, screenshots: []
  remove_filter :screenshots_attachments, :screenshots_blobs, :cover_attachment, :cover_blob

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
      f.input :tag_list
      f.input :cover, as: :file
      f.input :screenshots, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :tag_list
      row :cover do |game|
        image_tag(game.cover, size: '300x200')
      end
      row :screenshots do |game|
        game.screenshots.each do |image|
          span do
            image_tag(image, size: '300x200')
          end
        end
        span
      end
    end
  end
end
