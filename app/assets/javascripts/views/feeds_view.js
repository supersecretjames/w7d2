NR.Views.FeedsView = Backbone.View.extend({
  tagName: "ul",
  className: "feed-list",

  events: {
    "click button.add-feed": "addFeed"
  },

  initialize: function(){

  },

  render: function(){
    //this will get a collection
    var that = this;

    var renderContent = JST['feeds/list']({
      feeds: that.collection
    });

    that.$el.html(renderContent);
    //console.log("went through FeedsView");
    return that;
  },

  addFeed: function(){
    console.log("Adding Feed!!");
    Backbone.history.navigate('#/feeds/new')
  }

});