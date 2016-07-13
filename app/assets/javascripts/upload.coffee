ready = ->

  $("#video_file").fileupload
    url: '/video_upload'
    add: (e, data) ->
      jqXHR = data.submit()
            .success (result, textStatus, jqXHR) ->
              console.log(result)
            .error (jqXHR, textStatus, errorThrown) ->
              if errorThrown == 'abort'
                alert('File Upload has been canceled')
            .complete (result, textStatus, jqXHR) ->
              console.log("complete")

      $('button.cancel').click (e) ->
        jqXHR.abort()

    progress: (e, data) ->
      console.log parseInt(data.loaded*100/data.total)

$(document).on('turbolinks:load', ready)