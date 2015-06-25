# coding: utf-8
ActiveAdmin.register SmdbSearchVenom, :as => "SemanticVExtractor Record", :namespace => :db do


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

  permit_params :compound, :predicate, :object, :pmid

  index do
    #column("ID", :sortable => :id) {|item| link_to "#{item.id}", admin_v_extractor_records_path(item) }
    selectable_column
    id_column
    #actions
    column :compound
    column :predicate
    column :object
    column :pmid
  end


  show do

    panel "Venom information" do
      # #text_node "Some text"
      # attributes_table do
      #   row :compound
      #   row :predicate
      #   row :object
      #   row :pmid
      # end

      # table do
      #   tr do
      #     td
      #     td link_to "google", "http://google.com" +
      #        link_to "apple", "http://www.apple.com"
      #   end
      #   tr :class => "odd" do
      #     td "COMPOUND: ", :style => "font-weight:bold"
      #     td "#{semantic_v_extractor_record.compound}", :style => "font-weight:bold"
      #   end
      #   tr :class => "odd" do
      #     td "Search in:", :style => "font-style:italic"
      #     td link_to "UniProt",
      #                "http://www.uniprot.org/uniprot/?query=#{semantic_v_extractor_record.compound}&sort=score" 
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "GenomeNet",
      #                "http://www.genome.jp/dbget-bin/www_bfind_sub?mode=bfind&max_hit=1000&locale=en&serv=gn&dbkey=all&keywords=#{semantic_v_extractor_record.compound}&page=1"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "GenBank",
      #                "http://www.ncbi.nlm.nih.gov/nuccore/?term=#{semantic_v_extractor_record.compound}"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "NCBI Protein (GenPept)",
      #                "http://www.ncbi.nlm.nih.gov/protein/?term=#{semantic_v_extractor_record.compound}"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "EBI Search",
      #                "https://www.ebi.ac.uk/ebisearch/search.ebi?query=#{semantic_v_extractor_record.compound}&db=allebi&requestFrom=ebi_index"
      #   end

      #   ################

      #   tr :class => "even" do
      #     td "PREDICATE: ", :style => "font-weight:bold"
      #     td "#{semantic_v_extractor_record.predicate}", :style => "font-weight:bold"
      #   end
        
      #   ################
        
      #   tr :class => "odd" do
      #     td "OBJECT: ", :style => "font-weight:bold"
      #     td "#{semantic_v_extractor_record.object}", :style => "font-weight:bold"
      #   end
      #   tr :class => "odd" do
      #     td "Search in:", :style => "font-style:italic"
      #     td link_to "UniProt",
      #                "http://www.uniprot.org/uniprot/?query=#{semantic_v_extractor_record.object}&sort=score" 
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "GenomeNet",
      #                "http://www.genome.jp/dbget-bin/www_bfind_sub?mode=bfind&max_hit=1000&locale=en&serv=gn&dbkey=all&keywords=#{semantic_v_extractor_record.object}&page=1"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "GenBank",
      #                "http://www.ncbi.nlm.nih.gov/nuccore/?term=#{semantic_v_extractor_record.object}"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "NCBI Protein (GenPept)",
      #                "http://www.ncbi.nlm.nih.gov/protein/?term=#{semantic_v_extractor_record.object}"
      #   end
      #   tr :class => "odd" do
      #     td
      #     td link_to "EBI Search",
      #                "https://www.ebi.ac.uk/ebisearch/search.ebi?query=#{semantic_v_extractor_record.object}&db=allebi&requestFrom=ebi_index"
      #   end

      #   tr :class => "even" do
      #     td "PMID: (direct link)", :style => "font-weight:bold"
      #     td link_to "#{semantic_v_extractor_record.pmid}",
      #                "http://www.ncbi.nlm.nih.gov/pubmed/#{semantic_v_extractor_record.pmid}"
      #   end
      # end

      render('/admin/semantic_v_extractor_table', :model => 'smdb_search_venoms', :semantic_v_extractor_record => semantic_v_extractor_record)

      hr

      div :style => "font-style:italic" do
        simple_format "Note: the search query links above generally do not map to exact records, and not all searches will return matching results."
      end

      #render('/admin/links_out_smdb', :model => 'smdb_search_venoms', :compound => semantic_v_extractor_record)
    end

  end

  sidebar "Metadata", only: :show do
    
    attributes_table_for semantic_v_extractor_record do
      row :created_at
      row :updated_at
    end
  end

  sidebar "\"Editor's Choice\" venom queries" do
    ### Content here! (how do I build search queries??)
    table do
      tr do
        td link_to "Exenatide (653)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=exenatide&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Bombesin (243)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=bombesin&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Exendin-4 (154)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=exendin-4&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Ziconotide (132)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=ziconotide&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Ancrod (120)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=ancrod&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Cilengitide (91)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=cilengitide&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Melittin (81)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=melittin&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Liraglutide (78)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=liraglutide&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Bee venom (68)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=bee+venom&commit=Filter&order=id_desc"
      end
      tr do
        td link_to "Batroxobin (36)", "http://venomkb.herokuapp.com/db/semantic_v_extractor_records?utf8=✓&q%5Bcompound_equals%5D=batroxobin&commit=Filter&order=id_desc"
      end
    end
  end

end
