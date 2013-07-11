var editor = CodeMirror.fromTextArea(document.getElementById('code'), {
  mode: 'text/x-dzintars',
  styleActiveLine: true,
  lineNumbers: true,
  tabSize: 2
});

editor.setSize(520, 500);

$('#run').on('click', function(e) {
  e.preventDefault();
  $('.dzintars_rezult').html('<img src="/images/loading.gif">');
  $.post('/', { code: editor.getValue() }, function(data) {
    $('.dzintars_rezult').html(data);
  });
})