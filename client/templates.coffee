Template.layout.helpers
  todos: -> todos.find {}, sort: done: 1, priority: -1
  doneClass: -> if @done then 'done'

Template.layout.events
  'click button.add': -> todos.insert text: '', priority: 1, done: false

Template.todo.helpers
  doneIconClass: -> if @done then 'fa-check-square' else 'fa-square'

Template.todo.events
  'keyup .text': (e) -> update @_id, text: $(e.target).val()
  'click .done': (e) -> update @_id, done: (not (@done ? false))
  'click .priority': (e) -> update @_id, priority: (@priority+1)%4

  update = (id, data) -> todos.update id, $set: data
