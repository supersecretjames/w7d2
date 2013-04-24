NR.Routers.FeedsRouter = Backbone.Router.extend({
  initialize: function (rootEl, feeds){
    this.$rootEl = $(rootEl);
    this.feeds = feeds;
  },

  routes: {
    "": "index",
    "feeds/:id/entries": "feedEntries",
    "feeds/new": "new"
  },

  index: function () {
    var that = this;


    var feedsView = new NR.Views.FeedsView({
      collection: NR.Store.Feeds
    });

    that.$rootEl.html(feedsView.render().$el);
  },

  feedEntries: function(feedId){
    var that = this;

    var feed = NR.Store.Feeds.get(feedId);
    var feedEntriesView = new NR.Views.FeedEntriesView({ model: feed });
    that.$rootEl.html(feedEntriesView.render().$el);
  },

  new: function () {
    var that = this;

    var newFeedView = new NR.Views.NewFeedView({
      collection: NR.Store.Feeds,
      model: new NR.Models.Feed()
    });

    that.$rootEl.html(newFeedView.render().$el)
  }

});