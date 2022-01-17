window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
    // Number()、parseInt()、parseFloat()は、金額を消して空文字になるとNaN表記となるため、空文字で0表記となるMath.floor()を使用
    // const inputValue = priceInput.value;で数値として変換されているので、Math.floor()使用可能
  })
});