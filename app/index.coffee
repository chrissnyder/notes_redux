require './lib/setup'

{Router, history} = Backbone
projectName = 'notes_from_nature'

Api = require 'zooniverse/lib/api'
new Api project: projectName

translate = require 't7e'
translate.load require './lib/en-us'

app = {}
app.container = '#app'

app.topBar = new (require 'zooniverse/controllers/top-bar')
app.topBar.el.prependTo 'body'

app.header = new (require './views/header')
app.header.$el.prependTo app.container

app.router = new (require './lib/router')
app.router.$el.appendTo app.container

app.footer = new (require 'zooniverse/controllers/footer')
app.footer.el.appendTo app.container

history.start()

Project = require 'zooniverse/models/project'
Project.extended = true
Project.fetch()

User = require 'zooniverse/models/user'
User.fetch()

module.exports = app