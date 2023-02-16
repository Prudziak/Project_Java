function add_to_cart(prodId, prodName, prodPrice){
    let cart = localStorage.getItem("cart");
    if (cart === null){
        let products = [];
        let product = {productId:prodId, productName:prodName, productQuantity:1, productPrice:prodPrice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
    } else {
        let pcart = JSON.parse(cart);
        let existingProd = pcart.find((item) => item.productId === prodId);
        if (existingProd) {
            existingProd.productQuantity += 1;
            pcart.map((item) => {
                if (item.productId === existingProd.productId){
                    item.productQuantity = existingProd.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
        } else {
            let product = {productId:prodId, productName:prodName, productQuantity:1, productPrice:prodPrice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
        }
    }
        updateCart();
        alert("Dodano do koszyka");
}

// wizualizacja koszyka
function updateCart(){
    let cart = localStorage.getItem("cart");
    let cartObj = JSON.parse(cart);
    if (cartObj === null || cartObj.length === 0) {
        console.log("koszyk jest pusty");
        $(".cart-body").html("<h3>Koszyk jest pusty</h3>");
        $(".checkout-btn").removeClass('enabled');
        $(".checkout-btn").addClass('disabled');
    } else {
        let table = `
            <table class="table">
            <thead class="thread-light">
                <tr>
                    <th>Nazwa produktu</th>
                    <th>Cena</th>
                    <th>Ilość</th>
                    <th>Suma</th>
                    <th>Opcje</th>
                </tr>
            </thead>
            `;
        let razem = 0;
        cartObj.map((item) => {
            table += `
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productQuantity * item.productPrice}</td>
                    <td><button onclick="removeFromCart(${item.productId})" class="btn btn-warning btn-sm">Usuń</td>
                </tr>
            `;
            razem += item.productPrice * item.productQuantity;
        });
        
        table = table + `
            <tr><td colspan='5' class='text-right'><b>Razem: ${razem} PLN </b></td></tr>
        </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").removeClass('disabled');
        $(".checkout-btn").addClass('enabled');
    }
}

function removeFromCart(prodId){
    let cart = JSON.parse(localStorage.getItem("cart"));
    let newCart = cart.filter((item) => item.productId !== prodId);
    localStorage.setItem("cart", JSON.stringify(newCart));
    updateCart();
}

function Checkout(){
    window.location = "checkout.jsp";
}

$(document).ready(function() {
    updateCart();
});