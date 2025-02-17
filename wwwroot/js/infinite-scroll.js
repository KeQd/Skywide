$(document).ready(function () {
    console.log("infinite-scroll.js is loaded");
    var page = 1; 
    var loading = false; 

    // Funkcja do ładowania nowych postów
    function loadPosts() {
        if (loading) return; // Jeśli już trwa ładowanie, nie wysyłaj kolejnego zapytania
        loading = true; // Ustaw flagę na true
        $('#loading').show(); // Pokaż komunikat o ładowaniu
        page++; // Zwiększ numer strony

        // Wykonaj zapytanie AJAX do serwera
        $.ajax({
            url: '/Category/CategoryPage', // Ta sama ścieżka co dla pełnego widoku
            data: { slug: $('meta[name="slug"]').attr('content'), page: page }, // Slug i numer strony
            type: 'GET',
            success: function (response) {
                // Jeśli odpowiedź zawiera posty
                if (response) {
                    $(".posts-wall").append(response); // Dodajemy nowe posty do ściany
                    loading = false; // Zmieniamy flagę
                    $('#loading').hide(); // Ukrywamy komunikat o ładowaniu
                }
            },
            error: function () {
                loading = false;
                $('#loading').hide(); // Ukrywamy komunikat
                alert('Error loading posts.');
            }
        });
    }

    // Zdarzenie scrolla
    $(window).scroll(function () {
        // Sprawdzamy, czy użytkownik przewinął do końca strony
        if ($(window).scrollTop() + $(window).height() == $(document).height()) {
            loadPosts(); // Ładujemy nowe posty
        }
    });
});
