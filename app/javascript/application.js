// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.getElementById("menu").addEventListener("click", function() {
  document.getElementById("toggle-bar").classList.toggle("hidden");
  document.getElementById("mcv").classList.add("blur");
});

document.getElementById("bi-cls").addEventListener("click", function() {
  document.getElementById("toggle-bar").classList.toggle("hidden");
  document.getElementById("mcv").classList.remove("blur");
});
