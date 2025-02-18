// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
require("@popperjs/core");

import Rails from "@rails/ujs";

import "bootstrap";
import "../stylesheets/application";

document.addEventListener("turbolinks:load", () => {
  const tooltipTriggerList = document.querySelectorAll(
    '[data-bs-toggle="tooltip"]',
  );
  const tooltipList = [...tooltipTriggerList].map(
    (tooltipTriggerEl) => new bootstrap.Tooltip(tooltipTriggerEl),
  );
});

Rails.start();
