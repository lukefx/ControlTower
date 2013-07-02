# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#dropzone").filedrop ->
      url: $(this).data('url'),
      data: { _method:'PUT' },
      paramname: 'application[deployable]',
      maxfilesize: 50,
      docOver: -> $("#dropzone").children("span").text("Io accetto un file")
      docLeave: -> $("#dropzone").children("span").text("Drop files here")

