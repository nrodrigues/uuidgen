uuid = null

module.exports =

  activate: ->
      atom.commands.add 'atom-text-editor', 'uuidgen:generate': => @generate()

  generate: ->
      uuid ?= require('node-uuid')
      editor = atom.workspace.getActiveTextEditor()
      if editor
          editor.insertText(uuid.v4())
