uuid = null

module.exports =

  activate: ->
      atom.workspaceView.command "uuidgen:generate", => @generate()

  generate: ->
      uuid ?= require('node-uuid')
      editor = atom.workspace.activePaneItem
      if editor
          editor.insertText(uuid.v4())
