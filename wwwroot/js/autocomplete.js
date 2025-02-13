
document.getElementById("CategoryName").addEventListener("input", function () {
    let query = this.value;

    if (query.length >= 3) {
        fetch(`/api/categories/autocomplete?query=${query}`)
            .then(response => response.json())
            .then(data => {
                const suggestionsList = document.getElementById("suggestions");
                suggestionsList.innerHTML = '';

                const limitedResults = data.slice(0, 3);

                limitedResults.forEach(category => {
                    const li = document.createElement("li");
                    li.textContent = category.name;
                    li.addEventListener("click", function () {
                        // Można zdefiniować, co ma się stać po kliknięciu w sugestię
                        document.getElementById("CategoryName").value = category.name;
                        suggestionsList.innerHTML = '';
                    });
                    suggestionsList.appendChild(li);
                });

                // Jeżeli brak wyników, pokaż komunikat
                if (limitedResults.length === 0) {
                    const li = document.createElement("li");
                    li.textContent = "No categories found";
                    suggestionsList.appendChild(li);
                }
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
    } else {
        document.getElementById("suggestions").innerHTML = '';
    }
});
