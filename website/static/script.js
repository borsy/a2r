let logoutButton = document.getElementById('logout-button');
let webshopButton = document.getElementById('webshop-button');
let aboutButton = document.getElementById('about-button');
let contractButton = document.getElementById('contract-button');
let categoryList = document.getElementById('category-list');

let container = document.getElementById('container');

let redirect = 'main';

let authenticated = false;

let cartCount = 0;

let overallPrice = 0;

window.onload = function () {
    fetch('/get-csrf-token')
        .then(res => res.json())
        .then(data => {
            document.cookie = data.csrf_token;
    });
    fetch('/authenticated')
        .then(res => res.json())
        .then(data => {
            if (data.logged_in) {
                document.getElementById('login-button').style.display = 'none';
                document.getElementById('logout-button').style.display = 'block';
                document.getElementById('message').style.display = 'block';
                authenticated = true;
            } else {
                document.getElementById('message').style.display = 'none';
                document.getElementById('login-button').style.display = 'block';
                document.getElementById('logout-button').style.display = 'none';
            }
        });
};
webshopButton.onclick = function() {webshopClicked();};

function webshopClicked() {
    redirect = 'webshop';
    fetch('/categories')  // A módosított végpont neve
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
        });
};

function categoryClicked(category) {
    redirect = `webshop/${category.id}`;
    fetch('/category/' + category)
    .then(res => res.json())
    .then(data => {
        container.innerHTML = null;
        for (let i = 0; i < data.length; i++) {
            let card = document.createElement('div');
            card.className = 'product-card';

                let name = document.createElement('div');
                let price = document.createElement('div');
                let description = document.createElement('div');
                let button = document.createElement('div');

                name.className = 'product-name';
                price.className = 'product-price';
                description.className = 'product-description';
                button.className = 'product-button';
                name.textContent = data[i].name;
                price.textContent = parseInt(data[i].price) + ' Ft';
                description.textContent = data[i].description;
                button.textContent = 'Kosárba';
                button.setAttribute('id', data[i].id)

                card.appendChild(name);
                card.appendChild(price);
                card.appendChild(description);
                card.appendChild(button);
                container.appendChild(card);
            }
        productCardsAddFunction();
        if (!authenticated) {
            let prodBut = document.getElementsByClassName('product-button');
            for (let i = 0; i < prodBut.length; i++) {
                prodBut[i].style.backgroundColor = 'gray';
                prodBut[i].style.pointerEvents = 'none';
                prodBut[i].onclick = null;
            }
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

document.getElementById('register').onclick = function() {
    categoryList.innerHTML = null;

    form = "<form id='registrationForm' action='/register/' method='POST'>";
    form += "<label for='newUsername'>Felhasználónév:</label><input type='text' id='newUsername' name='newUsername' required>";
    form += "<label for='lastName'>Vezetéknév:</label><input type='text' id='lastName' name='lastName' required>";
    form += "<label for='firstName'>Keresztnév:</label><input type='text' id='firstName' name='firstName' required>";
    form += "<label for='birthdate'>Születési dátum:</label><input type='date' id='birthdate' name='birthdate' required>";
    form += "<label for='address'>Lakcím:</label><input type='text' id='address' name='address' required>";
    form += "<label for='email'>Email cím:</label><input type='email' id='email' name='email' required>";
    form += "<label for='newPassword'>Jelszó:</label><input type='password' id='newPassword' name='newPassword' required>";
    form += "<label for='confirmPassword'>Jelszó megerősítése:</label><input type='password' id='confirmPassword' name='confirmPassword' required>";
    form += "<div class='privacy-container'><div><input type='checkbox' id='acceptPrivacyRegistration' name='acceptPrivacyRegistration' required>";
    form += "<label for='acceptPrivacyRegistration'>Elfogadom az <a href='#' target='_blank'>adatvédelmi nyilatkozatot</a>.</label></div></div>";
    form += "<button type='submit' class='registButton'>Regisztráció</button></form>";
    container.innerHTML = form;
}

document.getElementById('login-button').onclick = function() {
    categoryList.innerHTML = null;
    fetch('/get-csrf-token/')
        .then(response => response.json())
        .then(data => {
            const csrfToken = data.csrf_token;

            form = "<form id='loginForm' action='/login/' method='POST'>";
            form += `<input type='hidden' name='csrfmiddlewaretoken' value='${csrfToken}'>`;
            form += "<label for='email'>Felhasználónév:</label><input type='text' id='email' name='username' required></br>";
            form += "<label for='password'>Jelszó:</label><input type='password' id='password' name='password' required></br>";
            form += "<div class='privacy-container'><div><input type='checkbox' id='acceptPrivacyRegistration' name='acceptPrivacyRegistration' required>";
            form += "<label for='acceptPrivacyRegistration'>Elfogadom az <a href='#' target='_blank'>adatvédelmi nyilatkozatot</a>.</label></div></div>";
            form += "<button type='submit' class='loginButton'>Belépés</button></form>";

            container.innerHTML = form;

            getCartItems();
        })
}

document.getElementById('logout-button').onclick = function() {
    categoryList.innerHTML = null;
    fetch('/logout')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                authenticated = false;
                document.getElementById('logout-button').style.display = 'none';
                document.getElementById('login-button').style.display = 'block';
                messageBox("Üzenet", "Sikeres kijelentkezés!", "OK");
                document.getElementById('message').style.display = 'none';
                
                cartCount = 0;
                document.getElementById('cart-count').innerHTML = cartCount;
                
                if (!authenticated) {
                    let prodBut = document.getElementsByClassName('product-button');
                    for (let i = 0; i < prodBut.length; i++) {
                        prodBut[i].style.backgroundColor = 'gray';
                        prodBut[i].style.pointerEvents = 'none';
                        prodBut[i].onclick = null;
                    }
                }
            }
        })
}

function productCardsAddFunction() {
    let productCards = document.getElementsByClassName('product-card');
    for (let i = 0;  i < productCards.length; i++) {
        productCards[i].onclick = function() {
            fetch('/addcart/' + productCards[i].getElementsByClassName('product-button')[0].getAttribute('id'))
                .then(response => response.json())
                .then(data => {
                    if (data.succes) {
                        cartCount += 1;
                        document.getElementById('cart-count').innerHTML = cartCount;
                    }
                })
        }
    }
}

function getCartCount() {
fetch('/authenticated')
    .then(res => res.json())
    .then(auth => {
        if (auth.logged_in) {
            fetch('/getcart')
                .then(response => response.json())
                .then(data => {
                    if (data.success != false) {
                        cartCount = data.length;
                        document.getElementById('cart-count').innerHTML = cartCount;
                    }
                })
            }
        })
    }
getCartCount();

document.getElementById('cart').onclick = function() {
    fetch('/authenticated')
    .then(res => res.json())
    .then(auth => {
        if (auth.logged_in) {
            fetch('/getcart')
                .then(response => response.json())
                .then(data => {
                    if (data.success != false) {
                        document.getElementById('container').innerHTML = null;
                        let cartContainer = document.createElement('div');
                        cartContainer.id = 'cart-container';
                        let cartOverall = document.createElement('div');
                        cartOverall.id = 'cart-overall';
                        for (let i = 0; i < data.length; i++) {
                            let card = document.createElement('div');
                            card.className = 'cart-card';

                            let name = document.createElement('div');
                            name.innerHTML = data[i].product.name;
                            let price = document.createElement('div');
                            overallPrice += parseInt(data[i].product.price);
                            price.innerHTML = parseInt(data[i].product.price) + " Ft";
                            let deleteButton = document.createElement('div');
                            deleteButton.className = 'delete-cart-button';
                            deleteButton.id = 'cart-' + data[i].id;
                            deleteButton.innerHTML = "Törlés";

                            card.appendChild(name);
                            card.appendChild(price);
                            card.appendChild(deleteButton);

                            cartContainer.appendChild(card);
                        }
                        let overallPriceDiv = document.createElement('div');
                        overallPriceDiv.innerHTML = "A rendelés végösszege: " + overallPrice + " Ft";
                        let buyButton = document.createElement('div');
                        buyButton.id = 'buy-cart-button';
                        buyButton.innerHTML = "Megrendelés";
                        buyButton.addEventListener('click', ()=>{
                            alert('Köszönjük a megrendelését.')
                        })
                        cartOverall.appendChild(overallPriceDiv);
                        cartOverall.appendChild(buyButton);
                        let hr = document.createElement('hr');
                        cartContainer.appendChild(hr);
                        cartContainer.appendChild(cartOverall);
                        document.getElementById('container').appendChild(cartContainer);
                        cartItemsAddFunction();
                        if (overallPrice <= 0) {
                            document.getElementById('buy-cart-button').style.backgroundColor = 'gray';
                            document.getElementById('buy-cart-button').style.pointerEvents = 'none';
                        }
                    }
                })
        }
    })
}

function cartItemsAddFunction() {
    let cartItems = document.getElementsByClassName('cart-card');
    for (let i = 0;  i < cartItems.length; i++) {
        cartItems[i].getElementsByClassName('delete-cart-button')[0].onclick = function() {
            fetch('/removecart/' + cartItems[i].getElementsByClassName('delete-cart-button')[0].id.replace('cart-', ''))
                .then(response => response.json())
                .then(data => {
                    if (data.succes) {
                        overallPrice -= parseInt(cartItems[i].getElementsByTagName('div')[1].innerHTML.replace(' Ft', ''));
                        document.getElementById('cart-overall').getElementsByTagName('div')[0].innerHTML = "A rendelés végösszege: " + overallPrice + " Ft";
                        cartCount -= 1;
                        document.getElementById('cart-count').innerHTML = cartCount;
                        cartItems[i].remove();
                        if (overallPrice <= 0) {
                            document.getElementById('buy-cart-button').style.backgroundColor = 'gray';
                            document.getElementById('buy-cart-button').style.pointerEvents = 'none';
                        }
                    }
                })
        }
    }
}

function messageBox(title, message, button) {
    let messageBox = document.createElement('div');
    messageBox.className ='messagebox';
    let messageBoxContent = document.createElement('div');
    messageBoxContent.className ='messagebox-content';
    let messageBoxHeader = document.createElement('div');
    messageBoxHeader.className ='messagebox-header';
    messageBoxHeader.innerHTML = title;
    messageBoxContent.appendChild(messageBoxHeader);
    let messageBoxText = document.createElement('div');
    messageBoxText.className ='messagebox-text';
    messageBoxText.innerHTML = message;
    messageBoxContent.appendChild(messageBoxText);
    let messageBoxButton = document.createElement('div');
    messageBoxButton.className ='messagebox-button';
    messageBoxButton.innerHTML = button;
    messageBoxContent.appendChild(messageBoxButton);
    messageBox.appendChild(messageBoxContent);
    document.body.appendChild(messageBox);

    messageBoxButton.onclick = () => {
        document.body.removeChild(messageBox);
    }
}