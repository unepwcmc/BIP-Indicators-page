class BIPIndicatorsPage.Models.Partner extends Backbone.Model
  paramRoot: 'partner'

  defaults:
    name: null

class BIPIndicatorsPage.Collections.PartnersCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Partner
  url: '/partners'
