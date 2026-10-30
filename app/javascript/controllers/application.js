import { Application } from '@hotwired/stimulus';

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };


document.querySelector('.bi-box-arrow-left').addEventListener('click', function() {
  if(confirm('Are you sure you want to logout?')) {
    window.location.href = '/users/sign_out'
  }
})