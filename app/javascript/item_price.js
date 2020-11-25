if (document.URL.match( /new/ ) ) {
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
 priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTax = document.getElementById("add-tax-price");
  addTax.innerHTML = Math.floor(inputValue*0.1);
    tax = addTax.innerHTML;

  const profit = document.getElementById("profit");
  profit.innerHTML = Math.floor(inputValue-tax);
    fit = profit.innerHTML;
  })
});
}