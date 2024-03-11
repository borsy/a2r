// ! EZT OLVASD EL ELŐSZÖR
// A leírásban a csillagok (*) azok mutatnak az ugyan annyi csillag felé. Tehát a ** mutat a következő sorokban lévő **-ra!!!
// Állítsd be ezt true-ra, ha látni akarod a pontos adatokat console-ban!

let debug = false;

/* Lekérjük a container ID-s div-et */
let cointainer = document.getElementById("cointainer");
 /* Adok neki egy saját attribútumot aminek az a neve, hogy "anim" 
 .* Azaz úgy fog kinézni, hogy: <div id="container" anim="false">...</div>
 .* Azért csinálom ezt, hogy megnézzem, hogy fut-e egy másik animáció, ha fut akkor a másik nem fog futni közben.
  */
container.setAttribute('anim', 'false');

 /*
 .* Létrehozok egy olyan function-t ami be fogja tölteni az animációkat. 
  */
function loadAnimation() {
    // Lekérdezem a "product-card" class-os diveket (mindet) majd berakom egy cards változókba.
    let cards = document.getElementsByClassName('product-card');
    let timer;
    // Elindítok egy for loopot ami annyiszor fut le amennyi kártya van
    for (let i = 0; i < cards.length; i++) {
        // Csinálok egy thisCard nevű változót amibe beletöltöm az aktuális kártyát
        let thisCard = cards[i];
        // Amikor az aktuális kártyára viszi a felhasználó az egeret akkor elindul a következő kódsor **
        thisCard.onmouseenter = function() {
            if (debug) { console.log(`DEBUG | A cursor belépett a(z) ${i}. kártyán!`); }
            // Megnézem, hogy fut-e másik animávió, ha nem akkor elkezdem, ezt az animációt.
            if (container.getAttribute('anim') == 'false') {
                // Beállítom, hogy a containeren belül fut animáció.
                container.setAttribute('anim', 'true');
                // Lekérdezem, mikor indult el az animáció.
                let start = Date.now();
                // Elindítok egy szálon futó késleltetett animációt.
                timer = setInterval(function() {
                    // Megnézem, hogy mennyi idő telt el az animáció kezdete óta.
                    let timePassed = Date.now() - start;
                    // Az animáció 10ms(milisecundum)-ig futhat, ha lefutott a 10ms akkor lenyomjuk a késleltetést majd a containerben beállítjuk, hogy...
                    // véget ért az animáció majd kilépünk a késleltetésből (Interval) a return szóval.
                    if (timePassed >= 10) {
                        clearInterval(timer);
                        container.setAttribute('anim', 'false');
                        if (debug) { console.log(`DEBUG | Az animáció lejárt ${timePassed}ms-nál.`); }
                        return;
                    }

                    // Minden késleltetett lefutáskor lefuttatom a draw function-t amiben elküldöm neki az aktuális kártyát és az eltelt időt.
                    draw(thisCard, timePassed);
                
                // Ebben a sorban látszik, hogy 1ms-os a késleltetést minden lefutás előtt.
                }, 1)
            }
        }
        //. ** Idáig fut le

        // Amikor a felhasználó elhagyja az egérrel a kártyát akkor ez a kód fog lefutni **
        cards[i].onmouseleave = function() {
            if (debug) { console.log(`DEBUG | Az cursor elhagyta a(z) ${i}. kártyát!`); }
            // Ugyan úgy megnézem, hogy van-e futó animáció, ha nincs akkor lefuttatom ezt.
            if (container.getAttribute('anim') == 'false') {
                // Megadok egy körülbelüli indexet amin az interval lefut.
                let index = 33;
                // Beállítom, hogy animációt futtatotk
                container.setAttribute('anim', 'true');
                // Megint lekérem az aktuális időt.
                let start = Date.now();
                // Lefuttatom az Interval-t
                timer = setInterval(function() {
                    // Megnézem az eltelt időt
                    let timePassed = Date.now() - start;
                    // Ha letelt a 10ms akkor megcsinálok mindent amit az előzőben is
                    if (timePassed >= 10){
                        clearInterval(timer);
                        container.setAttribute('anim', 'false');
                        if (debug) { console.log(`DEBUG | Az animáció lejárt ${timePassed}ms-nál.`); }
                        return;
                    }

                    // Ha az index nem 0 akkor lefuttatom a következőket
                    if (index > 0) {
                        // Kivonok 7-et az indexből, ez azt jelenti, hogy a box-shadow 7px-el fog mindig csökkeni, nem annyira szép, de jó ez is.
                        index -= 7;
                        // Ha az index kevesebb mint 7 akkor beállítóm 0-ra
                        if (index < 7) {
                            index = 0;
                            if (debug) { console.log(`DEBUG | Az index megállt ${index}-nál/nél`); }
                        }
                    }
                    // Most egy ellentétes animációt indítok itt
                    drawBack(cards[i], index);
                }, 1);
            }
        }
        //. ** Idáig fut le
    }
}

// Beállítok egy folytonos box-shadow-ot egy kártyára amit attribútumban kap
function draw(thisCard, timePassed) {
    thisCard.style.boxShadow = `0px 0px ${timePassed*3}px 0px rgba(0,0,0, .5)`;
    if (debug) { console.log(`DEBUG | boxShadow beállítva: ${thisCard.style.boxShadow}`); }
}

// Visszaveszem folytonosan a box-shadow-ot egy kártyára amit attribútumban kap
function drawBack(thisCard, index) {
    thisCard.style.boxShadow = `0px 0px ${index}px 0px rgba(0,0,0, .5)`;
    if (debug) { console.log(`DEBUG | boxShadow beállítva: ${thisCard.style.boxShadow}`); }
}

function appearContainer() {
    function containerOpacity(opacity) {
        document.getElementById('container').style.opacity = opacity;
        console.log(opacity);
    }
    let start = Date.now();
    let timer = setInterval(function() {
        let timePassed = Date.now() - start;
        if (timePassed >= 110) {
            clearInterval(timer);
            return;
        }
        if (timePassed < 100) {
            let opacity = timePassed / 100;
            containerOpacity(opacity);
        }
    }, 1);
}

function hideContainer() {
    function containerOpacity(opacity) {
        document.getElementById('container').style.opacity = opacity;
        console.log(opacity);
    }
    let index = 100;
    let start = Date.now();
    let timer = setInterval(function() {
        let timePassed = Date.now() - start;
        if (timePassed >= 110) {
            clearInterval(timer);
            return;
        }
        if (index > 0) {
            let opacity = index / 100;
            containerOpacity(opacity);
        }
        index--;
    }, 1);  
}