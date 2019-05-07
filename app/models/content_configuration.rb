require 'open_food_network/paperclippable'

class ContentConfiguration < Spree::Preferences::FileConfiguration
  include OpenFoodNetwork::Paperclippable

  # Header
  preference :logo, :file
  preference :logo_mobile, :file
  preference :logo_mobile_svg, :file
  has_attached_file :logo, default_url: "/assets/ofn-logo.png"
  has_attached_file :logo_mobile
  has_attached_file :logo_mobile_svg, default_url: "/assets/ofn-logo-mobile.svg"

  # Home page
  #
  # I intended to set a default for home_page_alert_html including I18n text.
  #   default: "<a href='/register' target='_blank'>#{I18n.t('shared.register_call.selling_on_ofn')}&nbsp;<strong>#{I18n.t('shared.register_call.register')}<i class='ofn-i_054-point-right'></i></strong></a>"
  #
  # Unfortunately, this configuration is initialised and cached before locales
  # are loaded. So I chose to not set a default and use a translatable view instead.
  # All the following defaults using I18n don't work.
  # https://github.com/openfoodfoundation/openfoodnetwork/issues/3816
  preference :home_page_alert_html, :text
  preference :home_hero, :file
  preference :home_show_stats, :boolean, default: true
  has_attached_file :home_hero, default_url: "/assets/home/home.jpg"

  # Producer sign-up page
  preference :producer_signup_pricing_table_html, :text, default: I18n.t(:content_configuration_pricing_table)
  preference :producer_signup_case_studies_html, :text, default: I18n.t(:content_configuration_case_studies)
  preference :producer_signup_detail_html, :text, default: I18n.t(:content_configuration_detail)

  # Hubs sign-up page
  preference :hub_signup_pricing_table_html, :text, default: I18n.t(:content_configuration_pricing_table)
  preference :hub_signup_case_studies_html, :text, default: I18n.t(:content_configuration_case_studies)
  preference :hub_signup_detail_html, :text, default: I18n.t(:content_configuration_detail)

  # Groups sign-up page
  preference :group_signup_pricing_table_html, :text, default: I18n.t(:content_configuration_pricing_table)
  preference :group_signup_case_studies_html, :text, default: I18n.t(:content_configuration_case_studies)
  preference :group_signup_detail_html, :text, default: I18n.t(:content_configuration_detail)

  # Main URLs
  preference :menu_1, :boolean, default: true
  preference :menu_1_icon_name, :string, default: "ofn-i_019-map-pin"
  preference :menu_2, :boolean, default: true
  preference :menu_2_icon_name, :string, default: "ofn-i_037-map"
  preference :menu_3, :boolean, default: true
  preference :menu_3_icon_name, :string, default: "ofn-i_036-producers"
  preference :menu_4, :boolean, default: true
  preference :menu_4_icon_name, :string, default: "ofn-i_035-groups"
  preference :menu_5, :boolean, default: true
  preference :menu_5_icon_name, :string, default: "ofn-i_013-help"
  preference :menu_6, :boolean, default: false
  preference :menu_6_icon_name, :string, default: "ofn-i_035-groups"
  preference :menu_7, :boolean, default: false
  preference :menu_7_icon_name, :string, default: "ofn-i_013-help"

  # Footer
  preference :footer_logo, :file
  has_attached_file :footer_logo, default_url: "/assets/ofn-logo-footer.png"

  #Other
  preference :footer_facebook_url, :string, default: "https://www.facebook.com/OpenFoodNet"
  preference :footer_twitter_url, :string, default: "https://twitter.com/OpenFoodNet"
  preference :footer_instagram_url, :string, default: ""
  preference :footer_linkedin_url, :string, default: "http://www.linkedin.com/groups/Open-Food-Foundation-4743336"
  preference :footer_googleplus_url, :string, default: ""
  preference :footer_pinterest_url, :string, default: ""
  preference :footer_email, :string, default: "hello@openfoodnetwork.org"
  preference :community_forum_url, :string, default: "http://community.openfoodnetwork.org"
  preference :footer_links_md, :text, default: <<-EOS.strip_heredoc
    [Newsletter sign-up](/)

    [News](/)

    [Calendar](/)
EOS

  preference :footer_about_url, :string, default: "http://www.openfoodnetwork.org/ofn-local/open-food-network-australia/"

  #User Guide
  preference :user_guide_link, :string, default: 'https://guide.openfoodnetwork.org/'
end
