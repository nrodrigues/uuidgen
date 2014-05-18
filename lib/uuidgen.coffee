uuid = require('node-uuid')

module.exports =

  activate: ->
      atom.workspaceView.command "uuidgen:generate", => @generate()

  generate: ->
      editor = atom.workspace.activePaneItem
      if editor
          editor.insertText(uuid.v4())
