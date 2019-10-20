var shopItems = [];

function Item(name, price, count) {
    this.name = name;
    this.price = price;
    this.count = count;
}

$('document').ready(function () {
    init();
    updateStore();
});

function init() {
    $('#add-but').click(function() {
        var name = $('#name').val();
        var price = parseInt($('#price').val());
        shopItems.push(new Item(name, price, 0));
        updateStore();
    });
    $('#final-price-but').click(function() {
        let price = 0; 
        for (let i = 0; i < shopItems.length; ++i) {
            price += parseInt(shopItems[i].price) * parseInt(shopItems[i].count);
        }
        $('#final-price').text(`${price.toString()}₽`);
    });
}

function updateStore() {
    console.log("updating store...");
    $('.table-elem').remove();
    for (let i = 0; i < shopItems.length; i++) {
        addItem(shopItems[i].name, shopItems[i].price, shopItems[i].count);
    }
    $('#item-table .minusbutton').click(function() {
        let index = $(this).parent().index();
        if (shopItems[index].count > 0)
            shopItems[index].count--;
        $(this).parent().find(".amount").text(shopItems[index].count.toString());
    });
    $('#item-table .plusbutton').click(function() {
        let index = $(this).parent().index();
        shopItems[index].count++;
        $(this).parent().find(".amount").text(shopItems[index].count.toString());
    });
    $('#item-table .rmv-but').click(function() {
        shopItems.splice($(this).parent().index());
        updateStore();
    });
}

function addItem(name, price, count) {
    $('#item-table').append(`
    <li class="table-elem">
        <button class="rmv-but"></button>
        <div class="item-picture"></div>
        <div class="item-name item-text">${name}</div>
        <div class="minusbutton">-</div>
        <div class="amount">${count}</div>
        <div class="plusbutton">+</div>
        <div class="item-price item-text">${price}₽</div>
    </li>`);
}
