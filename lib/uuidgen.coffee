uuid = require('node-uuid')

module.exports =

  activate: ->
      atom.commands.add 'atom-text-editor', 'uuidgen:generate': => @generate(false)
      atom.commands.add 'atom-text-editor', 'uuidgen:generatecap': => @generate(true)

  generate: (caps) ->
      uuid ?= require('node-uuid')
      editor = atom.workspace.getActiveTextEditor()
      if editor
          sels = editor.getSelectionsOrderedByBufferPosition()
          for sel in sels
              if caps
                  sel.insertText(uuid.v4().toUpperCase())
              else
                  sel.insertText(uuid.v4())
