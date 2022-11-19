// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function(){
  const addTax = document.getElementById("add-tax-price");
  addTax.innerHTML = Math.floor(priceInput.value * 0.1);
  const addProfit = document.getElementById("profit");
  console.log(priceInput.innerHTML);
  addProfit.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
 })
});