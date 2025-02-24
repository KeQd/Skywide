$(document).ready(function () {
    console.log("infinite-scroll.js is loaded");

    var page = 1;
    var loading = false;

    function loadPosts() {
        if (loading) return;
        loading = true;
        $('#loading').show();
        page++;

        var url = '/Index/Index';

        $.ajax({
            url: url,
            data: { page: page },
            type: 'GET',
            success: function (response) {
                if (response) {
                    $(".wall-content").append(response);
                    loading = false;
                    $('#loading').hide();
                }
            },
            error: function () {
                loading = false;
                $('#loading').hide();
                alert('Error loading posts.');
            }
        });
    }
    $(window).scroll(function () {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            loadPosts();
        }
    });
});