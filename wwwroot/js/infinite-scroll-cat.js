$(document).ready(function () {
    console.log("infinite-scroll.js is loaded");
    var page = 1;
    var loading = false;

    function loadPosts() {
        if (loading) return;
        loading = true;
        $('#loading').show();
        page++;

        $.ajax({
            url: '/Category/CategoryPage',
            data: { slug: $('meta[name="slug"]').attr('content'), page: page },
            type: 'GET',
            success: function (response) {
                if (response) {
                    $(".posts-wall").append(response);
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
        if ($(window).scrollTop() + $(window).height() == $(document).height()) {
            loadPosts();
        }
    });
});