class Fbappbrilliance < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  enable :sessions

  SCOPE = 'email,read_stream'
  APP_ID = '310201642444288'
  if @app = Application.find_by_app_id(APP_ID)
    TITLE_PAGE      = @app.title_page
    TAB_FB_APP      = @app.tab_fb_app
    TAB_FB          = @app.tab_fb
    PREFIX_TBL      = @app.prefix_tbl
    SITE_URL_APP    = @app.site_url_app
    SITE_URL_NO_SSL = @app.site_url_no_ssl
    SITE_URL        = @app.site_url
    DS              = @app.ds
    REST_FB         = @app.rest_fb
    GRAPH_FB_VIDEO  = @app.graph_fb_video
    GRAPH_FB        = @app.graph_fb
    APP_SECRET      = @app.app_secret
    PAGE_URL        = @app.page_url
    PAGE_ID         = @app.page_id
  end
end
