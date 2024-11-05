import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["recipe"]

  remove(event) {
    event.preventDefault()
    const favoriteId = event.currentTarget.dataset.recipeId

    if (favoriteId) {
      fetch(`/favorites/${favoriteId}`, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
        },
      })
      .then(response => {
        if (response.ok) {
          const recipeElement = this.element.querySelector(`.fave-card[data-id="${favoriteId}"]`)
          if (recipeElement) {
            recipeElement.remove()
            // console.log('removed')
          }
        }
      })
      .catch(error => {
        console.error('Error:', error)
      })
    }
  }
}
