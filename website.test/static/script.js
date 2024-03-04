/*

M A GY A R Á Z A T


Ez a JavaScript kód egy egyszerű weboldal interaktivitását kezeli. Hadd magyarázzam el a kódot részleteiben:

Elemek kiválasztása:

javascript
Copy code
let webshopButton = document.getElementById('webshop-button');
let aboutButton = document.getElementById('about-button');
let contractButton = document.getElementById('contract-button');
let categoryList = document.getElementById('category-list');
let container = document.getElementById('container');
Ezek a sorok kiválasztják a HTML dokumentumban található gombokat, listát és tartalomtárolót a hozzájuk tartozó azonosítóik (ID-k) alapján.

Állandó változó beállítása:

javascript
Copy code
const URL = 'http://127.0.0.1:8000';
Egy állandó változó definiálása, amely egy API címet tartalmaz. Ezt az URL-t későbbi hívásokban használják fel.

Webshop gomb eseménykezelője:

javascript
Copy code
webshopButton.onclick = function() {
    // fetch hívás az API /categories végpontjára
    // Az eredmény JSON formátumban érkezik vissza
    // A visszakapott adatokat felhasználja a kategóriák listájának feltöltéséhez
};
Amikor a "webshop" gombra kattintanak, egy fetch hívás történik az API /categories végpontjára, majd a válasz alapján a kategóriák listája frissül a weboldalon.

Kategória kiválasztása eseménykezelő:

javascript
Copy code
function categoryClicked(category) {
    // fetch hívás az API /category/{category} végpontjára
    // Az eredmény JSON formátumban érkezik vissza
    // A visszakapott adatokat felhasználja a termékek listájának feltöltéséhez
}
Amikor egy kategóriára kattintanak, egy új fetch hívás történik az API /category/{category} végpontjára, majd a válasz alapján a termékek listája frissül a weboldalon.

Szerződés gomb eseménykezelője:

javascript
Copy code
contractButton.onclick = function() {
    // A kategóriák listáját és a tartalomtárolót üríti, majd egy Lorem Ipsum szöveget jelenít meg
};
Amikor a "contract" gombra kattintanak, az oldalon lévő kategóriák listáját és tartalomtárolóját törli, majd egy Lorem Ipsum szöveget helyez el a tartalomtárolóban.

Regisztrációs gomb eseménykezelője:

javascript
Copy code
document.getElementById('register').onclick = function () {
    // A kategóriák listáját törli, majd egy űrlapot jelenít meg a tartalomtárolóban a regisztrációhoz
};
Amikor a "register" gombra kattintanak, az oldalon lévő kategóriák listáját törli, majd egy űrlapot jelenít meg a tartalomtárolóban a regisztrációhoz.

Ez a kód egy egyszerű weboldal interakcióját vezérli, ahol a felhasználók kategóriákat választhatnak, megtekinthetik a kategóriához tartozó termékeket, regisztrálhatnak, és egyéb funkciókat használhatnak.

*/


let webshopButton = document.getElementById('webshop-button');
let aboutButton = document.getElementById('about-button');
let contractButton = document.getElementById('contract-button');
let categoryList = document.getElementById('category-list');

let container = document.getElementById('container');

const URL = 'http://127.0.0.1:8000'

webshopButton.onclick = function() {
    fetch(URL + '/categories')
    .then(res => res.json())
    .then(data => {
        let categoryList = document.getElementById('category-list');
        categoryList.innerHTML = null;
        for (let i = 0; i < data.length; i++) {
            let li = document.createElement('li');
            li.textContent = data[i].name;
            li.onclick = function() {categoryClicked(data[i].name)};
            categoryList.appendChild(li);
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
    categoryList.innerHTML = null;
    container.innerHTML = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis aliquam odio dicta soluta libero optio porro id autem quo deleniti rem neque eaque earum fugiat, ullam totam unde natus laborum illum ducimus? Accusantium neque, tempora sed repellat expedita aspernatur cumque itaque nesciunt ex commodi id placeat totam omnis pariatur aut autem laborum doloremque, culpa ea sequi. Consectetur unde eos fuga cumque modi! Error recusandae neque, corporis odio, perspiciatis quas sed dolorem inventore pariatur dolor officia vel facilis aperiam, incidunt suscipit soluta illo! Animi iusto, itaque deserunt illo quia expedita accusamus. Hic numquam debitis a, laborum facilis rem consequatur dolor officiis blanditiis neque, deserunt consectetur repellendus culpa eaque! Ducimus voluptatum, perspiciatis omnis iusto magnam quis voluptatem non possimus totam soluta porro cumque aliquid odit, commodi alias dolor. Deleniti maxime unde doloribus totam voluptatibus, porro blanditiis cum. Quam eum, enim laboriosam maxime, quas asperiores id perferendis voluptatibus aut tenetur quod, neque recusandae explicabo delectus facilis architecto? Sit accusantium labore illo dolore veritatis libero vitae quibusdam magnam earum possimus magni ullam rem doloribus, odio nulla est ad laborum cumque omnis neque, facilis, dolor pariatur nostrum? Reiciendis eum nihil ipsa. Dolorum aut reprehenderit, accusamus non dolor nam earum ipsa voluptate nostrum, debitis ullam mollitia, maxime praesentium error aperiam facilis. Corrupti culpa, consequatur expedita fugit praesentium ullam adipisci debitis voluptas maiores corporis amet dicta excepturi ipsum iusto voluptatibus earum veniam incidunt explicabo. Autem porro consequatur dolor fuga provident maxime inventore quibusdam magnam et ullam quisquam quos, mollitia corrupti expedita doloribus sunt incidunt quas possimus ad quasi tempore molestias. Qui quo sunt delectus maiores molestias alias minima enim exercitationem? Eaque aspernatur asperiores illum aperiam reiciendis omnis velit nostrum ab fuga, saepe voluptas, impedit voluptatibus, iusto possimus. Atque iusto error earum aliquid cum. Odio laboriosam dolores blanditiis. Sequi et doloribus ad neque similique aspernatur, nostrum, qui labore suscipit enim laboriosam amet aperiam, voluptates consequuntur consequatur iusto. Accusamus delectus sequi, hic accusantium mollitia odit, voluptates labore quasi ducimus a, ea ratione enim ut! Perspiciatis quas nihil quos quasi voluptatibus odit unde illum. Expedita a quam alias asperiores veniam. Architecto nesciunt consequatur quos ratione aliquam, labore voluptas vero maxime dolore? Corrupti blanditiis culpa provident necessitatibus facere neque similique, molestiae eos accusantium laborum itaque minus possimus consequatur illum ab quis fuga sit reprehenderit nam ducimus explicabo, facilis deleniti dignissimos. Ipsam commodi ad sint quae ab. Architecto sequi magni voluptate est quaerat natus consectetur excepturi ducimus alias assumenda? Distinctio, incidunt corporis.';
}

contractButton.onclick = function() {
    categoryList.innerHTML = null;
    container.innerHTML = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perspiciatis aliquam odio dicta soluta libero optio porro id autem quo deleniti rem neque eaque earum fugiat, ullam totam unde natus laborum illum ducimus? Accusantium neque, tempora sed repellat expedita aspernatur cumque itaque nesciunt ex commodi id placeat totam omnis pariatur aut autem laborum doloremque, culpa ea sequi. Consectetur unde eos fuga cumque modi! Error recusandae neque, corporis odio, perspiciatis quas sed dolorem inventore pariatur dolor officia vel facilis aperiam, incidunt suscipit soluta illo! Animi iusto, itaque deserunt illo quia expedita accusamus. Hic numquam debitis a, laborum facilis rem consequatur dolor officiis blanditiis neque, deserunt consectetur repellendus culpa eaque! Ducimus voluptatum, perspiciatis omnis iusto magnam quis voluptatem non possimus totam soluta porro cumque aliquid odit, commodi alias dolor. Deleniti maxime unde doloribus totam voluptatibus, porro blanditiis cum. Quam eum, enim laboriosam maxime, quas asperiores id perferendis voluptatibus aut tenetur quod, neque recusandae explicabo delectus facilis architecto? Sit accusantium labore illo dolore veritatis libero vitae quibusdam magnam earum possimus magni ullam rem doloribus, odio nulla est ad laborum cumque omnis neque, facilis, dolor pariatur nostrum? Reiciendis eum nihil ipsa. Dolorum aut reprehenderit, accusamus non dolor nam earum ipsa voluptate nostrum, debitis ullam mollitia, maxime praesentium error aperiam facilis. Corrupti culpa, consequatur expedita fugit praesentium ullam adipisci debitis voluptas maiores corporis amet dicta excepturi ipsum iusto voluptatibus earum veniam incidunt explicabo. Autem porro consequatur dolor fuga provident maxime inventore quibusdam magnam et ullam quisquam quos, mollitia corrupti expedita doloribus sunt incidunt quas possimus ad quasi tempore molestias. Qui quo sunt delectus maiores molestias alias minima enim exercitationem? Eaque aspernatur asperiores illum aperiam reiciendis omnis velit nostrum ab fuga, saepe voluptas, impedit voluptatibus, iusto possimus. Atque iusto error earum aliquid cum. Odio laboriosam dolores blanditiis. Sequi et doloribus ad neque similique aspernatur, nostrum, qui labore suscipit enim laboriosam amet aperiam, voluptates consequuntur consequatur iusto. Accusamus delectus sequi, hic accusantium mollitia odit, voluptates labore quasi ducimus a, ea ratione enim ut! Perspiciatis quas nihil quos quasi voluptatibus odit unde illum. Expedita a quam alias asperiores veniam. Architecto nesciunt consequatur quos ratione aliquam, labore voluptas vero maxime dolore? Corrupti blanditiis culpa provident necessitatibus facere neque similique, molestiae eos accusantium laborum itaque minus possimus consequatur illum ab quis fuga sit reprehenderit nam ducimus explicabo, facilis deleniti dignissimos. Ipsam commodi ad sint quae ab. Architecto sequi magni voluptate est quaerat natus consectetur excepturi ducimus alias assumenda? Distinctio, incidunt corporis.';
}

document.getElementById('register').onclick = function () {
    categoryList.innerHTML = null;

    form = "<form id='registrationForm'><label for='newUsername'>Felhasználónév:</label><input type='text' id='newUsername' name='newUsername' required<label for='lastName'>Vezetéknév:</label><input type='text' id='lastName' name='lastName' required<label for='firstName'>Keresztnév:</label><input type='text' id='firstName' name='firstName' required<label for='birthdate'>Születési dátum:</label><input type='date' id='birthdate' name='birthdate' required<label for='address'>Lakcím:</label><input type='text' id='address' name='address' required<label for='email'>Email cím:</label><input type='email' id='email' name='email' required<label for='newPassword'>Jelszó:</label><input type='password' id='newPassword' name='newPassword' required<label for='confirmPassword'>Jelszó megerősítése:</label><input type='password' id='confirmPassword' name='confirmPassword' required<div class='privacy-container'><div><input type='checkbox' id='acceptPrivacyRegistration' name='acceptPrivacyRegistration' required><label for='acceptPrivacyRegistration'>Elfogadom az <a href='#' target='_blank'>adatvédelmi nyilatkozatot</a>.</div></label></div><button type='submit' class='registButton'>Regisztráció</button></form>"
    container.innerHTML = form;
}

document.getElementById('login').onclick = function () {
    categoryList.innerHTML = null;

    form = "<form id='loginForm'><label for='newUsername'>Felhasználónév:</label><input type='email' id='email' name='email' required<label for='Password'>Jelszó:</label><input type='password' id='confirmPassword' name='confirmPassword' required<div class='privacy-container'><div><input type='checkbox' id='acceptPrivacyRegistration' name='acceptPrivacyRegistration' required><label for='acceptPrivacyRegistration'>Elfogadom az <a href='#' target='_blank'>adatvédelmi nyilatkozatot</a>.</div></label></div><button type='submit' class='loginButton'>Belépés</button></form>"
    container.innerHTML = form;
}
