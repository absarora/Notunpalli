$(document).ready ->
  
  multiple_photos_form = $("#new_photo")
  wrapper = multiple_photos_form.find(".progress-wrapper")
  bitrate = wrapper.find(".bitrate")
  progress_bar = wrapper.find(".progress-bar")
  
  multiple_photos_form.fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png|bmp)$/i
      file = data.files[0]
      if types.test(file.type) or types.test(file.name)
        data.submit()
      else
        alert file.name + " must be GIF, JPEG, BMP or PNG file"

  multiple_photos_form.on "fileuploadstart", ->
    wrapper.show()

  multiple_photos_form.on "fileuploaddone", ->
    wrapper.hide()
    progress_bar.width 0 # Revert progress bar's width back to 0 for future uploads

  multiple_photos_form.on "fileuploadprogressall", (e, data) ->
    bitrate.text (data.bitrate / 1024).toFixed(2) + "Kb/s"
    progress = parseInt(data.loaded / data.total * 100, 10)
    progress_bar.css("width", progress + "%").text progress + "%"