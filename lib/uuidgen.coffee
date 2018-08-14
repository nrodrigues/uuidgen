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
          editor.transact(()=>
              sels = editor.getSelectionsOrderedByBufferPosition()
              generatedUUID = uuid.v4()
              for sel in sels
                  if caps
                      sel.insertText(generatedUUID.toUpperCase())
                  else
                      sel.insertText(generatedUUID)
          )
