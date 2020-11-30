window.addEventListener('load', () => {
  const priceInput = document.getElementById("artist-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = inputValue * 0.1
    const Profit = document.getElementById("profit");
    Profit.innerHTML = inputValue - addTax.innerHTML
  });
});