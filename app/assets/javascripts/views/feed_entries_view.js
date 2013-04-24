NR.Views.FeedEntriesView = Backbone.View.extend({
  tagName: "ul",

  render: function () {
    var that = this;

    that.model.get("entries").fetch({
      success: function () {

        //var renderedContent =
          //that.model.get("entries").models[0].attributes.title;
        var renderedContent = JST["feeds/entries"]({
          entries: that.model.get("entries")
        });

        that.$el.html(renderedContent);
      }
    });

    return that;
  }
});