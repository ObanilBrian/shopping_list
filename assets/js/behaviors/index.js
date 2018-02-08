onmount('#index_page', function () {
  $('#clear').click(function(){
    $('input[name="item[name]"]').val('')
    $('input[name="item[description]"]').val('')
  })

  // $('.ui.form')
  // .form({
  //   fields: {
  //     'item[name]': {
  //       identifier: 'item[name]',
  //       rules: [
  //         {
  //           type   : 'empty',
  //           prompt : 'Please enter your name'
  //         }
  //       ]
  //     },
  //     'item[description]': {
  //       identifier: 'item[description]',
  //       rules: [
  //         {
  //           type   : 'empty',
  //           prompt : 'Please enter your description'
  //         }
  //       ]
  //     }
  //   }
  // })
});
