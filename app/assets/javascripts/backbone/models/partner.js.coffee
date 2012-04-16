class BIPIndicatorsPage.Models.Partner extends Backbone.Model
  paramRoot: 'partner'

  defaults:
    code: null
    name: null

class BIPIndicatorsPage.Collections.PartnersCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Partner
  url: '/partners'
