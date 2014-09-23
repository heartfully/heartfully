LovelyApp.Collections.Purchases = Backbone.Collection.extend({
  model: LovelyApp.Models.Purchase,

  url: '/api/v1/purchases.json',

  parse: function(response) {
    return response['purchases'];
  }

});