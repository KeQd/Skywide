document.getElementById("CategoryName").addEventListener("input", function () {
    let query = this.value;

    if (query.length >= 3) {
        fetch(`/api/categories/autocomplete?query=${query}`)
            .then(response => response.json())
            .then(data => {
                const suggestionsList = document.getElementById("suggestions");
                suggestionsList.innerHTML = '';

                if (data.length > 0) {
                    suggestionsList.removeAttribute("hidden");
                } else {
                    suggestionsList.setAttribute("hidden", "true");
                }

                data.forEach(category => {
                    const li = document.createElement("li");
                    li.textContent = category.name;
                    li.addEventListener("click", function () {
                        document.getElementById("CategoryName").value = category.name;
                        suggestionsList.setAttribute("hidden", "true");
                    });
                    suggestionsList.appendChild(li);
                });
            })
            .catch(error => console.error('Error fetching data:', error));
    } else {
        document.getElementById("suggestions").setAttribute("hidden", "true");
    }
});