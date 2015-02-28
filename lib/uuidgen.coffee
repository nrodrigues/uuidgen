uuid = null

module.exports =

  activate: ->
      atom.commands.add 'atom-text-editor', 'uuidgen:generate': => @generate()
      atom.commands.add 'atom-text-editor', 'uuidgen:generatecap': => @generatecap()

  generate: ->
      uuid ?= require('node-uuid')
      editor = atom.workspace.getActiveTextEditor()
      if editor
          sels = editor.getSelectionsOrderedByBufferPosition()
          for sel in sels
              sel.insertText(uuid.v4())

  generatecap: ->
      uuid ?= require('node-uuid')
      editor = atom.workspace.getActiveTextEditor()
      if editor
          sels = editor.getSelectionsOrderedByBufferPosition()
          for sel in sels
              sel.insertText(uuid.v4().toUpperCase())
