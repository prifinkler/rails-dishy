import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["recipe"]

  // connect() {
  //   console.log("favorites controller connected!")
  // }

  remove(event) {
    event.preventDefault()
    const favoriteId = event.currentTarget.dataset.favoriteId

    if (favoriteId) {
      fetch(`/favorites/${favoriteId}`, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        },
      })
      .then(response => {
        if (response.status === 200) {
          const recipeElement = this.element.querySelector(`.card-fv[data-id="${favoriteId}"]`)
          if (recipeElement) {
            recipeElement.remove()
          }
          // console.log('Recipe removed from favorites!')
        }
      })
      .catch(error => {
        console.error('Error:', error)
      })
    }
  }
}
