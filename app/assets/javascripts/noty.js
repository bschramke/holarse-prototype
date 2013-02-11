  this.notify_notice = function(msg) {
    if (msg !== "") {
      return noty({
        text: msg,
        layout: "bottomRight",
        theme: "noty_theme_default",
        type: "success",
        easing: "swing",
        animateOpen: {
          height: "toggle"
        },
        animateClose: {
          height: "toggle"
        },
        speed: "500",
        timeout: "5000",
        closeable: "true",
        closeOnSelfClick: "true",
        cssPrefix: 'noty_',
        closeButton: true
      });
    }
  };

  this.notify_warning = function(msg) {
    if (msg !== "") {
      return noty({
        text: msg,
        layout: "bottomRight",
        theme: "noty_theme_default",
        type: "alert",
        easing: "swing",
        animateOpen: {
          height: "toggle"
        },
        animateClose: {
          height: "toggle"
        },
        speed: "500",
        timeout: "5000",
        closeable: "true",
        closeOnSelfClick: "true",
        cssPrefix: 'noty_',
        closeButton: true
      });
    }
  };

  this.notify_error = function(msg) {
    if (msg !== "") {
      return noty({
        text: msg,
        layout: "bottomRight",
        theme: "noty_theme_default",
        type: "error",
        easing: "swing",
        animateOpen: {
          height: "toggle"
        },
        animateClose: {
          height: "toggle"
        },
        speed: "500",
        timeout: "5000",
        closeable: "true",
        closeOnSelfClick: "true",
        cssPrefix: 'noty_',
        closeButton: true
      });
    }
  };

  this.notify_loading = function(msg) {
    if (msg !== "") {
      return noty({
        text: msg,
        layout: "bottom",
        type: "success",
        textAlign: "center",
        easing: "swing",
        animateOpen: {
          height: "toggle"
        },
        animateClose: {
          height: "toggle"
        },
        speed: "500",
        timeout: "1000",
        closeable: "false",
        closeOnSelfClick: "false"
      });
    }
  };

$(document).ready(function() {
    $(".flash .notice").each(function() {
      var msg;
      msg = $(this).html().trim();
      return notify_notice(msg);
    });
    $(".flash .warning").each(function() {
      var msg;
      msg = $(this).html().trim();
      return notify_warning(msg);
    });
    return $(".flash .error").each(function() {
      var msg;
      msg = $(this).html().trim();
      return notify_error(msg);
    });
});
