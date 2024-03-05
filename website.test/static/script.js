let logoutButton = document.getElementById('logout-button');
let webshopButton = document.getElementById('webshop-button');
let aboutButton = document.getElementById('about-button');
let contractButton = document.getElementById('contract-button');
let categoryList = document.getElementById('category-list');

let container = document.getElementById('container');

const URL = 'http://127.0.0.1:8000';

window.onload = function () {
    // Az oldal betöltésekor ellenőrizze a bejelentkezési állapotot
    fetch(URL + '/check_login_status')
        .then(res => res.json())
        .then(data => {
            // Kijelentkezés gomb elrejtése
            document.getElementById('logout-button').style.display = 'none';

            if (data.logged_in) {
                // Ha be van jelentkezve, akkor lekérjük a kategóriákat
                fetch(URL + '/categories-authenticated/')  // A módosított végpont neve
                    .then(res => res.json())
                    .then(data => {
                        let categoryList = document.getElementById('category-list');
                        categoryList.innerHTML = null;
                        for (let i = 0; i < data.length; i++) {
                            let li = document.createElement('li');
                            li.textContent = data[i].name;
                            li.onclick = function () { categoryClicked(data[i].name) };
                            categoryList.appendChild(li);
                        }

                        // Hívjuk meg az alapértelmezett kategóriát is
                        if (data.length > 0) {
                            categoryClicked(data[0].name);
                        }

                        // Kijelentkezés gomb megjelenítése
                        document.getElementById('logout-button').style.display = 'block';
                    });
            } else {
                // Ha nincs bejelentkezve, akkor megfelelő üzenetet jelenítünk meg vagy átirányítjuk a bejelentkezési oldalra
                container.innerHTML = 'Csak bejelentkezett felhasználóknak elérhető a webshop. Kérem, jelentkezzen be.';
            }
        });
};

webshopButton.onclick = function () {
    // Ellenőrizzük, hogy be van-e jelentkezve a felhasználó
    fetch(URL + '/check_login_status')
        .then(res => res.json())
        .then(data => {
            if (data.logged_in) {
                // Ha be van jelentkezve, akkor lekérjük a kategóriákat
                fetch(URL + '/categories-authenticated/')  // A módosított végpont neve
                    .then(res => res.json())
                    .then(data => {
                        let categoryList = document.getElementById('category-list');
                        categoryList.innerHTML = null;
                        for (let i = 0; i < data.length; i++) {
                            let li = document.createElement('li');
                            li.textContent = data[i].name;
                            li.onclick = function () { categoryClicked(data[i].name) };
                            categoryList.appendChild(li);
                        }

                        // Hívjuk meg az alapértelmezett kategóriát is
                        if (data.length > 0) {
                            categoryClicked(data[0].name);
                        }

                        // Kijelentkezés gomb megjelenítése
                        document.getElementById('logout-button').style.display = 'block';
                    });
            } else {
                // Ha nincs bejelentkezve, akkor megfelelő üzenetet jelenítünk meg vagy átirányítjuk a bejelentkezési oldalra
                container.innerHTML = 'Csak bejelentkezett felhasználóknak elérhető a webshop. Kérem, jelentkezzen be.';

                // Rejtse el a kijelentkezés gombot
                document.getElementById('logout-button').style.display = 'none';
            }
        });
};

function categoryClicked(category) {
    fetch(URL + '/category/' + category)
    .then(res => res.json())
    .then(data => {
        container.innerHTML = null;
        for (let i = 0; i < data.length; i++) {
            let card = document.createElement('div');
            card.className = 'product-card';

            let name = document.createElement('div');
            let price = document.createElement('div');
            let description = document.createElement('div');

            name.className = 'product-name';
            price.className = 'product-price';
            description.className = 'product-description';
            name.textContent = data[i].name;
            price.textContent = parseInt(data[i].price) + ' Ft';
            description.textContent = data[i].description;

            card.appendChild(name);
            card.appendChild(price);
            card.appendChild(description);
            container.appendChild(card);
        }
    });
}

aboutButton.onclick = function() {
    // Elrejti a kijelentkezés gombot
    document.getElementById('logout-button').style.display = 'none';
    
    categoryList.innerHTML = null;
    container.innerHTML = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis aliquam odio dicta soluta libero optio porro id autem quo deleniti rem neque eaque earum fugiat, ullam totam unde natus laborum illum ducimus? Accusantium neque, tempora sed repellat expedita aspernatur cumque itaque nesciunt ex commodi id placeat totam omnis pariatur aut autem laborum doloremque, culpa ea sequi. Consectetur unde eos fuga cumque modi! Error recusandae neque, corporis odio, perspiciatis quas sed dolorem inventore pariatur dolor officia vel facilis aperiam, incidunt suscipit soluta illo! Animi iusto, itaque deserunt illo quia expedita accusamus. Hic numquam debitis a, laborum facilis rem consequatur dolor officiis blanditiis neque, deserunt consectetur repellendus culpa eaque! Ducimus voluptatum, perspiciatis omnis iusto magnam quis voluptatem non possimus totam soluta porro cumque aliquid odit, commodi alias dolor. Deleniti maxime unde doloribus totam voluptatibus, porro blanditiis cum. Quam eum, enim laboriosam maxime, quas asperiores id perferendis voluptatibus aut tenetur quod, neque recusandae explicabo delectus facilis architecto? Sit accusantium labore illo dolore veritatis libero vitae quibusdam magnam earum possimus magni ullam rem doloribus, odio nulla est ad laborum cumque omnis neque, facilis, dolor pariatur nostrum? Reiciendis eum nihil ipsa. Dolorum aut reprehenderit, accusamus non dolor nam earum ipsa voluptate nostrum, debitis ullam mollitia, maxime praesentium error aperiam facilis. Corrupti culpa, consequatur expedita fugit praesentium ullam adipisci debitis voluptas maiores corporis amet dicta excepturi ipsum iusto voluptatibus earum veniam incidunt explicabo. Autem porro consequatur dolor fuga provident maxime inventore quibusdam magnam et ullam quisquam quos, mollitia corrupti expedita doloribus sunt incidunt quas possimus ad quasi tempore molestias. Qui quo sunt delectus maiores molestias alias minima enim exercitationem? Eaque aspernatur asperiores illum aperiam reiciendis omnis velit nostrum ab fuga, saepe voluptas, impedit voluptatibus, iusto possimus. Atque iusto error earum aliquid cum. Odio laboriosam dolores blanditiis. Sequi et doloribus ad neque similique aspernatur, nostrum, qui labore suscipit enim laboriosam amet aperiam, voluptates consequuntur consequatur iusto. Accusamus delectus sequi, hic accusantium mollitia odit, voluptates labore quasi ducimus a, ea ratione enim ut! Perspiciatis quas nihil quos quasi voluptatibus odit unde illum. Expedita a quam alias asperiores veniam. Architecto nesciunt consequatur quos ratione aliquam, labore voluptas vero maxime dolore? Corrupti blanditiis culpa provident necessitatibus facere neque similique, molestiae eos accusantium laborum itaque minus possimus consequatur illum ab quis fuga sit reprehenderit nam ducimus explicabo, facilis deleniti dignissimos. Ipsam commodi ad sint quae ab. Architecto sequi magni voluptate est quaerat natus consectetur excepturi ducimus alias assumenda? Distinctio, incidunt corporis.';
}

contractButton.onclick = function() {
    // Elrejti a kijelentkezés gombot
    document.getElementById('logout-button').style.display = 'none';
    
    categoryList.innerHTML = null;
    container.innerHTML = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis aliquam odio dicta soluta libero optio porro id autem quo deleniti rem neque eaque earum fugiat, ullam totam unde natus laborum illum ducimus? Accusantium neque, tempora sed repellat expedita aspernatur cumque itaque nesciunt ex commodi id placeat totam omnis pariatur aut autem laborum doloremque, culpa ea sequi. Consectetur unde eos fuga cumque modi! Error recusandae neque, corporis odio, perspiciatis quas sed dolorem inventore pariatur dolor officia vel facilis aperiam, incidunt suscipit soluta illo! Animi iusto, itaque deserunt illo quia expedita accusamus. Hic numquam debitis a, laborum facilis rem consequatur dolor officiis blanditiis neque, deserunt consectetur repellendus culpa eaque! Ducimus voluptatum, perspiciatis omnis iusto magnam quis voluptatem non possimus totam soluta porro cumque aliquid odit, commodi alias dolor. Deleniti maxime unde doloribus totam voluptatibus, porro blanditiis cum. Quam eum, enim laboriosam maxime, quas asperiores id perferendis voluptatibus aut tenetur quod, neque recusandae explicabo delectus facilis architecto? Sit accusantium labore illo dolore veritatis libero vitae quibusdam magnam earum possimus magni ullam rem doloribus, odio nulla est ad laborum cumque omnis neque, facilis, dolor pariatur nostrum? Reiciendis eum nihil ipsa. Dolorum aut reprehenderit, accusamus non dolor nam earum ipsa voluptate nostrum, debitis ullam mollitia, maxime praesentium error aperiam facilis. Corrupti culpa, consequatur expedita fugit praesentium ullam adipisci debitis voluptas maiores corporis amet dicta excepturi ipsum iusto voluptatibus earum veniam incidunt explicabo. Autem porro consequatur dolor fuga provident maxime inventore quibusdam magnam et ullam quisquam quos, mollitia corrupti expedita doloribus sunt incidunt quas possimus ad quasi tempore molestias. Qui quo sunt delectus maiores molestias alias minima enim exercitationem? Eaque aspernatur asperiores illum aperiam reiciendis omnis velit nostrum ab fuga, saepe voluptas, impedit voluptatibus, iusto possimus. Atque iusto error earum aliquid cum. Odio laboriosam dolores blanditiis. Sequi et doloribus ad neque similique aspernatur, nostrum, qui labore suscipit enim laboriosam amet aperiam, voluptates consequuntur consequatur iusto. Accusamus delectus sequi, hic accusantium mollitia odit, voluptates labore quasi ducimus a, ea ratione enim ut! Perspiciatis quas nihil quos quasi voluptatibus odit unde illum. Expedita a quam alias asperiores veniam. Architecto nesciunt consequatur quos ratione aliquam, labore voluptas vero maxime dolore? Corrupti blanditiis culpa provident necessitatibus facere neque similique, molestiae eos accusantium laborum itaque minus possimus consequatur illum ab quis fuga sit reprehenderit nam ducimus explicabo, facilis deleniti dignissimos. Ipsam commodi ad sint quae ab. Architecto sequi magni voluptate est quaerat natus consectetur excepturi ducimus alias assumenda? Distinctio, incidunt corporis.';
}

document.getElementById('register').onclick = function () {
    // Elrejti a kijelentkezés gombot
    document.getElementById('logout-button').style.display = 'none';

    categoryList.innerHTML = null;

    form = "<form id='registrationForm'><label for='newUsername'>Felhasználónév:</label><input type='text' id='newUsername' name='newUsername' required><label for='lastName'>Vezetéknév:</label><input type='text' id='lastName' name='lastName' required><label for='firstName'>Keresztnév:</label><input type='text' id='firstName' name='firstName' required><label for='birthdate'>Születési dátum:</label><input type='date' id='birthdate' name='birthdate' required><label for='address'>Lakcím:</label><input type='text' id='address' name='address' required><label for='email'>Email cím:</label><input type='email' id='email' name='email' required><label for='newPassword'>Jelszó:</label><input type='password' id='newPassword' name='newPassword' required><label for='confirmPassword'>Jelszó megerősítése:</label><input type='password' id='confirmPassword' name='confirmPassword' required><div class='privacy-container'><div><input type='checkbox' id='acceptPrivacyRegistration' name='acceptPrivacyRegistration' required><label for='acceptPrivacyRegistration'>Elfogadom az <a href='#' target='_blank'>adatvédelmi nyilatkozatot</a>.</label></div></div><button type='submit' class='registButton'>Regisztráció</button></form>"
    container.innerHTML = form;
}

document.getElementById('login').onclick = function () {
    // AJAX kérés a CSRF token lekérdezéséhez
    fetch('/get-csrf-token/')
    .then(response => response.json())
    .then(data => {
        // CSRF token érték lementése
        const csrfToken = data.csrf_token;

        // Form létrehozása a CSRF token értékével
        form = "<form id='loginForm' action='/login/' method='post'>";
        form += "<input type='hidden' name='csrfmiddlewaretoken' value='" + csrfToken + "'>";
        form += "<label for='email'>Felhasználónév:</label><input type='text' id='email' name='username' required></br>";
        form += "<label for='password'>Jelszó:</label><input type='password' id='password' name='password' required></br>";
        form += "<div class='privacy-container'><div><input type='checkbox' id='acceptPrivacyRegistration' name='acceptPrivacyRegistration' required>";
        form += "<label for='acceptPrivacyRegistration'>Elfogadom az <a href='#' target='_blank'>adatvédelmi nyilatkozatot</a>.</label></div></div>";
        form += "<button type='submit' class='loginButton'>Belépés</button></form>";

        // Form megjelenítése
        container.innerHTML = form;

        // Belépés után a kijelentkezés gombra kattintva a felhasználó kijelentkezik
        document.getElementById('logout-button').onclick = function () {
            fetch('/logout/')
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Kijelentkezés sikerült, vissza a bejelentkezési képernyőre vagy más teendők
                    // Pl.: container.innerHTML = 'Sikeres kijelentkezés, további teendők...';
                } else {
                    // Kijelentkezés sikertelen, kezelni kell a hibát
                    // Pl.: container.innerHTML = 'Hiba történt a kijelentkezés során.';
                }
            });
        };
    });
}

document.getElementById('logout-button').onclick = function () {
    // AJAX kérés a kijelentkezés végpont felé
    fetch('/logout/')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Kijelentkezés sikeres, rejtse el a kijelentkezés gombot
                document.getElementById('logout-button').style.display = 'none';

                // Törölje a tartalmat a container-ben
                document.getElementById('container').innerHTML = '';

                // További műveletek, például az oldal frissítése vagy átirányítás
            } else {
                // Kijelentkezés sikertelen, kezelje az esetleges hibát
                console.error('Hiba a kijelentkezés során:', data.error);
            }
        });
}
