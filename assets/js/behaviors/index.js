onmount('#index_page', function () {
  $('#clear').click(function(){
    $('input[name="item[name]"]').val('')
    $('input[name="item[description]"]').val('')
  })

  $('.ui.form')
  .form({
    fields: {
      'item[name]': {
        identifier: 'item[name]',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter your name'
          }
        ]
      },
      'item[description]': {
        identifier: 'item[description]',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter your description'
          }
        ]
      }
    }
  })
})

onmount('#samsung', function() {
  $('#hamburger').click(function(){
    $('.ui.sidebar').sidebar('toggle')
  })

  $('.delete_phone').click(function(){
    let id = $(this).attr('phoneId')
    let name = $(this).attr('phoneName')
    let url = $(this).attr('phoneUrl')
    let description = $(this).attr('phoneDesc')

    $('#phone_id').text(`${id}`)
    $('#phone_name').text(`${name}`)
    $('#phone_url').attr(`src`,`${url}`)
    $('#phone_desc').text(`${description}`)
     $('.ui.modal').modal('show')
 })

$('#btnDelete').click(function(){
    let phone_id = $('#phone_id').text()
    let csrf = $('input[name="_csrf_token"]').val();
    $.ajax({
      url:`/${phone_id}/samsung`,
      headers: {"X-CSRF-TOKEN": csrf},
      type: 'DELETE',
      success: function(response){
        location.reload()
      // alertify.success('<i class="close icon"></i>Success')
      }
    });
})
})


onmount('#add_phone', function() {


  $('input[name="phone_list[url]"]').focusout(function(){
    let value = $(this).val()
    $('#phone_img').attr('src', value)
  })
})

