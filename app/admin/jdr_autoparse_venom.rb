# coding: utf-8
ActiveAdmin.register JdrAutoparseVenom, :as => "VExtractor Record", :namespace => :db do

  config.comments = true

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

  controller do
    actions :all, :except => [:edit, :destroy]
  end

  action_item :flag_for_review, only: :show do
    link_to 'Flag for review', flag_jdr_autoparse_venom_path, method: :put
  end
  
  index do
    selectable_column
    id_column
    column :venom
    column :effect
    column :pmid
    column("Flagged for review?") { |venom| venom.status.nil? ? status_tag("not flagged") : status_tag("flagged", :error) }
  end

  show do

    panel "Venom information" do
      #text_node "Some text"
      # attributes_table do
      #   row :venom
      #   row :effect
      #   row :pmid
      # end

      # table do
      #   tr :class => "odd" do
      #     td "VENOM: ", :style => "font-weight:bold"
      #     td "#{v_extractor_record.venom}", :style => "font-weight:bold"
      #   end
      #   tr :class => "odd" do
      #     td "Search in:", :style => "font-style:italic"
      #     td link_to "UniProt",
      #                "http://www.uniprot.org/uniprot/?query=#{v_extractor_record.venom}&sort=score" 
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "GenomeNet",
      #                "http://www.genome.jp/dbget-bin/www_bfind_sub?mode=bfind&max_hit=1000&locale=en&serv=gn&dbkey=all&keywords=#{v_extractor_record.venom}&page=1"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "GenBank",
      #                "http://www.ncbi.nlm.nih.gov/nuccore/?term=#{v_extractor_record.venom}"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "NCBI Protein (GenPept)",
      #                "http://www.ncbi.nlm.nih.gov/protein/?term=#{v_extractor_record.venom}"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "EBI Search",
      #                "https://www.ebi.ac.uk/ebisearch/search.ebi?query=#{v_extractor_record.venom}&db=allebi&requestFrom=ebi_index"
      #   end
        
      #   tr :class => "even" do
      #     td "EFFECT: ", :style => "font-weight:bold"
      #     td "#{v_extractor_record.effect}", :style => "font-weight:bold"
      #   end
      #   tr :class => "even" do
      #     td "Search in:", :style => "font-style:italic"
      #     td link_to "UniProt",
      #                "http://www.uniprot.org/uniprot/?query=#{v_extractor_record.effect}&sort=score" 
      #   end
      #   tr :class => "even" do
      #     td
      #     td link_to "GenomeNet",
      #                "http://www.genome.jp/dbget-bin/www_bfind_sub?mode=bfind&max_hit=1000&locale=en&serv=gn&dbkey=all&keywords=#{v_extractor_record.effect}&page=1"
      #   end
      #   tr :class => "even" do
      #     td
      #     td link_to "GenBank",
      #                "http://www.ncbi.nlm.nih.gov/nuccore/?term=#{v_extractor_record.effect}"
      #   end
      #   tr :class => "even" do
      #     td
      #     td link_to "NCBI Protein (GenPept)",
      #                "http://www.ncbi.nlm.nih.gov/protein/?term=#{v_extractor_record.effect}"
      #   end
      #   tr :class => "even" do
      #     td
      #     td link_to "EBI Search",
      #                "https://www.ebi.ac.uk/ebisearch/search.ebi?query=#{v_extractor_record.effect}&db=allebi&requestFrom=ebi_index"
      #   end

      #   tr :class => "odd" do
      #     td "PMID: (direct link)", :style => "font-weight:bold"
      #     td link_to "#{v_extractor_record.pmid}",
      #                "http://www.ncbi.nlm.nih.gov/pubmed/#{v_extractor_record.pmid}"
      #   end
      # end

      render('/admin/v_extractor_table', :model => 'jdr_autoparse_venoms', :v_extractor_record => v_extractor_record)

      hr

      div :style => "font-style:italic" do
        simple_format "Note: the search query links above generally do not map to exact records, and not all searches will return matching results."
      end

      hr

      div do
        "Think this record was included in the database erroneously? Click the following button to flag the record for review by the site's admins:"
      end

      
      
      # render('/admin/links_out', :model => 'jdr_autoparse_venoms', :venom => v_extractor_record)
    end

    active_admin_comments

  end

  sidebar "Metadata", only: :show do
    #render('/admin/metadata', :model => 'manual_venoms', :venom => manually_curated_venom)
    attributes_table_for v_extractor_record do
      row :created_at
      row :updated_at
    end
  end

  sidebar "\"Editor's Choice\" venom queries" do
    ### Content here! (how do I build search queries??)
    table do
      tr do
        td link_to "Exenatide (1878)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=exenatide&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Bombesin (1119)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=bombesin&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Ancrod (708)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=ancrod&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Suborder serpentes (678)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=suborder+serpentes&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Agkistrodon serine proteinase (600)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=agkistrodon+serine+proteinase&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Apis mellifera (528)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=apis+mellifera&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Order araneae (502)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=order+araneae&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Cobra venom (460)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=cobra&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Wasp venom (435)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=wasp+venom&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Ziconotide (251)", "http://venomkb.herokuapp.com/db/v_extractor_records?utf8=✓&q%5Bvenom_equals%5D=ziconotide&commit=Filter&order=id_desc"
      end
    end

  end

  

end
