NR.Models.Feed = Backbone.RelationalModel.extend({
  urlRoot: "/feeds",
  relations:[{
    type: Backbone.HasMany,
    key: "entries",
    relatedModel: "NR.Models.Entry",
    collectionType: "NR.Collections.FeedEntries",

    colectionOptions: function (feed) {
      return { feed : feed };
    },

    reverseRelation: {
      key: "feed",
      keySource: "feed_id",
      includeInJSON: "id"
    }
  }],
});