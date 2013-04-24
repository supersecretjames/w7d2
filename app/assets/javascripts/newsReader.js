window.NR = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Store: {},

  initialize: function(sidebar, contentEl, feeds, entries){
    NR.Store.Feeds = new NR.Collections.Feeds(feeds);
    NR.Store.Entries = new NR.Collections.Entries(entries);

    this.installSidebar(sidebar);

    new NR.Routers.FeedsRouter(contentEl, feeds);
    Backbone.history.start();
  },

  installSidebar: function (sidebar) {
    var that = this;
    var feedsView = new NR.Views.FeedsView({
      collection: NR.Store.Feeds
    });

    sidebar.html(feedsView.render().$el)
  }

};