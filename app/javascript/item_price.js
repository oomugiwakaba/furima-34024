window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");

    price = Math.floor(inputValue * 0.1);

    addTaxDom.innerHTML = price;


    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = inputValue - price;

  })

});