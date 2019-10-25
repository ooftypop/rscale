// $(document).on('turbolinks:load', function() {
//
//   $('form').on('click', '.remove_record', function(event) {
//     $(this).prev('input[type=hidden]').val('1');
//     $(this).closest('tr').hide();
//     return event.preventDefault();
//   });
//
//   $('form').on('click', '.add_fields', function(event) {
//     var regexp, time;
//     time = new Date().getTime();
//     regexp = new RegExp($(this).data('id'), 'g');
//     $('.fields').append($(this).data('fields').replace(regexp, time));
//     return event.preventDefault();
//   });
//
// });

function searchTable() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}

function slideUp_messages() {
  var flash_messages = $('.flash-message').length
  var timeout = 2000 + (flash_messages-1) * 1000
  return setTimeout((function() {
    $('.flash-message').each(function() {
      if ($(this).find('a').length == 0) {
        $(this).slideUp();
      };
    });
  }), timeout);
};
