document.getElementById("searchQuery").addEventListener("input", function () {
    let query = this.value;

    if (query.length >= 3) {
        fetch(`/api/categories/autocomplete-search?query=${query}`)
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
                    li.setAttribute("data-slug", category.slug);

                    li.addEventListener("click", function () {
                        window.location.href = `/Category/CategoryPage?slug=${category.slug}`;
                    });

                    suggestionsList.appendChild(li);
                });

                let currentIndex = -1;
                let listItems = suggestionsList.getElementsByTagName("li");
                const listItemsArray = Array.from(listItems);

                function navigate(direction) {
                    if (direction === 'down' && currentIndex != listItemsArray.length - 1) currentIndex++;
                    else if (direction === 'up' && currentIndex > 0) currentIndex--;

                    listItemsArray.forEach((item, index) => {
                        if (index === currentIndex) {
                            item.classList.add("highlighted");
                        } else {
                            item.classList.remove("highlighted");
                        }
                    });
                }

                document.addEventListener("keydown", function (e) {
                    console.log(e.key);
                    if (e.key === "ArrowDown") {
                        e.preventDefault();
                        navigate('down');
                    } else if (e.key === "ArrowUp") {
                        e.preventDefault();
                        navigate('up');
                    } else if (e.key === "Enter") {
                        e.preventDefault();
                        const selectedItem = listItemsArray[currentIndex];
                        const selectedSlug = selectedItem.getAttribute("data-slug");
                        window.location.href = `/Category/CategoryPage?slug=${selectedSlug}`;
                    }
                });
            })
            .catch(error => console.error('Error fetching data:', error));
    } else {
        document.getElementById("suggestions").setAttribute("hidden", "true");
    }
});