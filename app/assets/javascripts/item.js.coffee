$ ->
  $(document).on "click", "#cancel_edit", (e) ->
    $('.item-form-edit').each ->
      $(this).hide()

  $(document).on "ajax:success", "#new_item", (e, data, status, xhr) ->
    $(".table").append(data.item)
    $("#item_name").val("")
    $("#item_picture").val("")
    $(".item-form-edit").hide()

  $(document).on "click", ".view-form-edit-item", (e) ->
    e.preventDefault()
    $('.item-form-edit').each ->
      $(this).show()

  $(document).on "ajax:success", ".form-edit-item", (e, data, status, xhr) ->
    form_row =  $(e.currentTarget).closest("tr")
    form_row.prev().replaceWith(data.item)
    form_row.remove()
    $(".item-form-edit").hide()

  $(document).on "ajax:success", ".item-destroy", (e, data, status, xhr) ->
    $(".item-form-edit-" + data.item + "").remove()
    $(".tr-item-form-edit-" + data.item + "").remove()
    $("#item-" + data.item + "").remove()
    $(".item-form-edit").hide()

    # $("#edit_item_" + data.item + "").remove()
