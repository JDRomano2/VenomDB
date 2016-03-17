ActiveAdmin.register_page "Dashboard", namespace: :db do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    panel "Comment on new community editing functionality" do
      para "VenomKB now supports community editing and comments on individual database records."

      para "To make use of these new features, create a free (and secure) user account. Once you are logged in, you will see new \"Add\" and \"Edit\" buttons when browsing the database. You will also be able to post comments once logged in."
    end

    columns do
      
      column do
        panel "Info" do
          h4 "Welcome to VenomKB's interactive web interface!"
          para "Please click on the menu items at the top of the page to navigate to each of the individual databases."
        end
      end

      column do
        panel "Recent News and Updates" do
          ul do
            li "2016-03-17: VenomKB is now hosted at venomkb.org. We have addtionally migrated to a new faster server, so the site should be much more responsive than before we made the move."
            li "2015-08-13: We have added a number of new community editing features. Guests can now create user accounts, and logged-in users can add new database records and comment on existing ones!"
            li "2015-06-24: Individual database record pages now have search query links for a number of related databases and ontologies"
            li "2015-06-23: 'Semantic VExtractor' and 'VExtractor' have been manually reviewed for bad records and updated on the website"
          end
        end
      end
      
    end

    hr

    panel "Description of database tables" do
      para "VenomKB currently contains 3 database tables:"

      ul do
        li "Manually Curated Venoms: Manually-curated putative venom therapies, with relevant PubMed IDs"
        li "VExtractor: Records returned by the JDRAutoparse script, which uses the NCBO Annotator to extract possible venom compounds and their physiologic effects from MEDLINE abstracts"
        li "Semantic VExtractor: Possible venoms identified in MEDLINE using the SMDB_Search utility to extract semantic knowledge from Semantic MEDLINE"
      end

      para "To browse each of these databases interactively, please click on the links at the top of the page"
    end
    
  end # content
end
