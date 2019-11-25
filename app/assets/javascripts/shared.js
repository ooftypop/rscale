function searchTable(index_name) {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById(`${index_name}Input`);
  filter = input.value.toUpperCase();
  table = document.getElementById(`${index_name}Table`);
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
