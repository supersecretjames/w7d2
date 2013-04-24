NR.Collections.FeedEntries = Backbone.Collection.extend({
  model: NR.Models.Feed,

  initialize: function (models, options) {
    this.feed = options.feed;
  },

  url: function () {
    return "/feeds/" + this.feed.id + "/entries"
  }
});