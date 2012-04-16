class BIPIndicatorsPage.Models.Target extends Backbone.Model
  paramRoot: 'target'

  defaults:
    goal_id: null
    code: null
    keyword: null
    title: null
    # extra fields for interface
    selected: false

  select: ->
    @trigger('unique:select:target')
    @set({'selected': true})
    @selectInGoal(true)
    router.filterByTarget(@)

  deselect: ->
    @set({'selected': false})
    @selectInGoal(false)

  selectInGoal: (is_selected) ->
    localStorageKey = "bip_goals-" + @attributes.goal_id
    goal = JSON.parse(localStorage.getItem(localStorageKey));
    if goal != null
      # update the target in the goal's targets array
      target.selected = is_selected for target in goal.targets when target.id is @id
      localStorage.setItem(localStorageKey, JSON.stringify(goal))

class BIPIndicatorsPage.Collections.TargetsCollection extends Backbone.Collection
  model: BIPIndicatorsPage.Models.Target
  url: '/targets'

  selectAll: ->
    _.each @models, (target) ->
      target.select

  deselectAll: ->
    _.each @models, (target) ->
      target.deselect()

  selected: ->
    @filter (target) ->
      target.get('selected')
