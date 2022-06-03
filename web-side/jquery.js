$(document).ready(function() {
    window.addEventListener("offline", function() {
        $("#displayNui").css("display", "flex") 
        $.post("http://luke_dupe/lock") 
    });

    window.addEventListener("online", function() { 
        setTimeout(function() {
            $("#displayNui").css("display", "none") 
            $.post("http://luke_dupe/unlock") 
        }, 5000)
    });
});