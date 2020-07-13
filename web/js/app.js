$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
});

 $('#myModal').modal('hide');