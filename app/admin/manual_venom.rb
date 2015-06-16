ActiveAdmin.register ManualVenom, :as => "Manually Curated Venom" do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  
  permit_params :venom, :effect, :pmid

  show do

    panel "Venom information" do
      #text_node "Some text"
      attributes_table do
        row :venom
        row :effect
        row :pmid
      end

      render('/admin/links_out', :model => 'manual_venoms', :venom => manually_curated_venom)
    end

    # panel "Links to external resources" do
    #   render('/admin/links_out', :model => 'manual_venoms', :venom => manually_curated_venom)
    # end

  end

  sidebar "Metadata", only: :show do
    #render('/admin/metadata', :model => 'manual_venoms', :venom => manually_curated_venom)
    attributes_table_for manually_curated_venom do
      row :created_at
      row :updated_at
    end
  end

end
