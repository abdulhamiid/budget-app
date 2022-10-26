// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

const menu = document.getElementById('menu');
const close = document.getElementById('bi-cls');

menu.addEventListener('click', () => {
  document.getElementById('toggle-bar').classList.toggle('hidden');
  document.getElementById('mcv').classList.add('blur');
});

close.addEventListener('click', () => {
  document.getElementById('toggle-bar').classList.toggle('hidden');
  document.getElementById('mcv').classList.remove('blur');
});
