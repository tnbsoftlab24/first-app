document.addEventListener("turbolinks:load", function() {
  var product_id = $('#comment_product_id').val();
  var current_user_id = $('#comment_actual_user').val();

  $('#new_comment').on('ajax:success', function(e, data, status, xhr){
      $('#comment_body').val('');
  }).on('ajax:error',function(e, xhr, status, error){
  });
  App.comments = App.cable.subscriptions.create( { channel: 'CommentsChannel', product_id: product_id }, {
    received: function(data) {
          return $('#messages-list').append(this.renderMessage(data));
    },
    renderMessage: function(data) {
      var template = "<div class='row'>" +
        "<div class='col-md-12'>" +
          "<div class='single-discussion-message'>" +
            "<div class='card my-1'>" +
              "<div class='card-body py-1'>" +
                "<p>" +
                  "<strong class='float-left'>" + data.user_name + "</strong>" +
                  "<span class='text-muted float-right'>" + data.created_at + "</span>" +
                "</p>" +
                "<div class='clearfix'></div>" +
                "<p>" + data.body + "</p>" +
              "</div>" +
            "</div>" +
          "</div>" +
        "</div>" +
      "</div>";
      return $.parseHTML(template);
    }
  });
});
