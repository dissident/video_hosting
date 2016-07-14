ready = ->

  $("#video_file").fileupload
    url: '/video_upload'
    add: (e, data) ->
      jqXHR = data.submit()
            .success (result, textStatus, jqXHR) ->
              Turbolinks.visit(location.toString())
            .error (jqXHR, textStatus, errorThrown) ->
              console.log jqXHR
              if errorThrown == 'abort'
                alert('File Upload has been canceled')
              else
                if jqXHR.status == 422
                  alert('Error upload. Сheck the file extension. Valid: avi, mp4')
                else
                  alert('Error upload')
              Turbolinks.visit(location.toString())

            .complete (result, textStatus, jqXHR) ->
              console.log("complete")

      $('.videos_list').append("<div class='row video_line uploaded'>
        <div class='col-md-3'>Видео загружается ...</div>
        <div class='col-md-3 '></div>
        <div class='col-md-3 percents'></div>
        <div class='col-md-3 cancel'><button class='cancel'>Отменить</button></div>")

      $('button.cancel').click (e) ->
        jqXHR.abort()

    progress: (e, data) ->
      percent = parseInt(data.loaded*100/data.total)
      $('.uploaded .percents').empty()
      $('.uploaded .percents').append("#{percent}%")

  $('.new_video_link').on 'click', ->
    $('#video_file').trigger 'click'

  $('.change_video_title').on 'click', (e) ->
    $line_wrapper = $(e.target).parent().parent()
    $line_wrapper.find('input').off 'focusout'
    toggle_input = ->
      $line_wrapper.find('.input').toggleClass 'hide'
      $line_wrapper.find('.text').toggleClass 'hide'
    toggle_input()
    $line_wrapper.find('input').focus()
    $line_wrapper.find('input').focusout ->
      toggle_input()
    false

  $('.add_tag').on 'click', (e) ->
    $tags_wrapper = $(e.target).parent()
    $tags_wrapper.find('input').off 'focusout'
    toggle_input = ->
      $tags_wrapper.find('.add_tag_input').toggleClass 'hide'
    toggle_input()
    $tags_wrapper.find('input').focus()
    $tags_wrapper.find('input').focusout ->
      toggle_input()
    false

$(document).on('turbolinks:load', ready)