NR.Views.NewFeedView = Backbone.View.extend({
  events: {
    "click button.submit": "submit"
  },

  render: function () {
    var that = this;

    var renderedContent = JST["feeds/new"]();
    that.$el.html(renderedContent);
    return that;
  },

  submit: function () {
    var that = this;

    that.model.set({
      source: that.$("input[name=feed\\[source\\]]").val()
    });

    that.collection.add(that.model);
    that.model.save();
    Backbone.history.navigate("#/");
  }
});