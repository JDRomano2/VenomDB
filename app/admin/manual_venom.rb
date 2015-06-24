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

  index do
    #column("ID", :sortable => :id) {|item| link_to "#{item.id}", admin_v_extractor_records_path(item) }
    selectable_column
    id_column
    #actions
    column :venom
    column :effect
    column :pmid
  end

  show :title => :id do

    panel "Venom information" do
      #text_node "Some text"
      # attributes_table do
      #   row :venom
      #   row :effect
      #   row :pmid
      # end

      table do
        tr :class => "odd" do
          td "VENOM: ", :style => "font-weight:bold"
          td "#{manually_curated_venom.venom}", :style => "font-weight:bold"
        end
        tr :class => "odd" do
          td "Search in:", :style => "font-style:italic"
          td link_to "UniProt",
                     "http://www.uniprot.org/uniprot/?query=#{manually_curated_venom.venom}&sort=score" 
        end
        tr :class => "odd" do
          td
          td link_to "GenomeNet",
                     "http://www.genome.jp/dbget-bin/www_bfind_sub?mode=bfind&max_hit=1000&locale=en&serv=gn&dbkey=all&keywords=#{manually_curated_venom.venom}&page=1"
        end
        tr :class => "odd" do
          td
          td link_to "GenBank",
                     "http://www.ncbi.nlm.nih.gov/nuccore/?term=#{manually_curated_venom.venom}"
        end
        tr :class => "odd" do
          td
          td link_to "NCBI Protein (GenPept)",
                     "http://www.ncbi.nlm.nih.gov/protein/?term=#{manually_curated_venom.venom}"
        end
        tr :class => "odd" do
          td
          td link_to "EBI Search",
                     "https://www.ebi.ac.uk/ebisearch/search.ebi?query=#{manually_curated_venom.venom}&db=allebi&requestFrom=ebi_index"
        end
        
        tr :class => "even" do
          td "EFFECT: ", :style => "font-weight:bold"
          td "#{manually_curated_venom.effect}", :style => "font-weight:bold"
        end
        tr :class => "even" do
          td "Search in:", :style => "font-style:italic"
          td link_to "UniProt",
                     "http://www.uniprot.org/uniprot/?query=#{manually_curated_venom.effect}&sort=score" 
        end
        tr :class => "even" do
          td
          td link_to "GenomeNet",
                     "http://www.genome.jp/dbget-bin/www_bfind_sub?mode=bfind&max_hit=1000&locale=en&serv=gn&dbkey=all&keywords=#{manually_curated_venom.effect}&page=1"
        end
        tr :class => "even" do
          td
          td link_to "GenBank",
                     "http://www.ncbi.nlm.nih.gov/nuccore/?term=#{manually_curated_venom.effect}"
        end
        tr :class => "even" do
          td
          td link_to "NCBI Protein (GenPept)",
                     "http://www.ncbi.nlm.nih.gov/protein/?term=#{manually_curated_venom.effect}"
        end
        tr :class => "even" do
          td
          td link_to "EBI Search",
                     "https://www.ebi.ac.uk/ebisearch/search.ebi?query=#{manually_curated_venom.effect}&db=allebi&requestFrom=ebi_index"
        end

        tr :class => "odd" do
          td "PMID: (direct link)", :style => "font-weight:bold"
          td link_to "#{manually_curated_venom.pmid}",
                     "http://www.ncbi.nlm.nih.gov/pubmed/#{manually_curated_venom.pmid}"
        end
      end

      hr

      div :style => "font-style:italic" do
        simple_format "Note: the search query links above generally do not map to exact records, and not all searches will return matching results."
      end
      
      #render('/admin/links_out', :model => 'manual_venoms', :venom => manually_curated_venom)
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
