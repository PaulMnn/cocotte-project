document.addEventListener('DOMContentLoaded', function() {
  // Sélectionnez le bouton de téléchargement par son ID
  var downloadButton = document.getElementById('downloadButton');

  // Ajoutez un gestionnaire d'événement pour le clic sur le bouton
  downloadButton.addEventListener('click', function(event) {
    // Empêchez le comportement par défaut du lien (rechargement de la page)
    event.preventDefault();
