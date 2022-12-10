$(document).ready(function(){
  $('upload input').change(function () {
    $('upload p').text(this.files.length + " file(s) selected");
  });
});