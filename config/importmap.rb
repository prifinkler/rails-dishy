pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/dist/esm/index.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
pin "hammerjs", to: "https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"

# Pin your controllers directory
pin_all_from "app/javascript/controllers", under: "controllers"
pin "application", preload: true
