uuid = null

module.exports =

  activate: ->
      commandSubscription = atom.commands.add 'atom-text-editor',
        'uuidgen:generate': => @generate(false)
        'uuidgen:generate-upper-case': => @generate(true)

  dispose: ->
      commandSubscription.dispose()

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
