import { Controller } from "@hotwired/stimulus";
import Hammer from 'hammerjs';

export default class extends Controller {
  static targets = ["swiperContainer", "allCards"]

  connect() {
    this.initializeCards();
    console.log("Swiper controller connected");

  }

  initializeCards() {
    const swiperContainer = this.element;
    const allCards = this.element.querySelectorAll('.swiper--card');

    allCards.forEach((el) => {
      const hammertime = new Hammer(el);

      hammertime.on('pan', (event) => {
        el.classList.add('moving');
      });

      hammertime.on('pan', (event) => {
        // Detect swipe direction
        if (event.deltaX > 0) {
          el.classList.add('like'); // Add a class to indicate liking
        } else {
          el.classList.remove('like');
        }
      });

      hammertime.on('panend', (event) => {
        el.classList.remove('moving');
        if (event.deltaX > 100) {
          // If the swipe distance is greater than 100 pixels (adjust as needed)
          this.handleLike(el);
        } else {
          // Reset card position
          el.style.transform = '';
          el.classList.remove('like');
        }
      });
    });
  }

  handleLike(card) {
    const recipeId = card.dataset.recipeId; // Assuming you have a 'data-recipe-id' attribute on your card element

    fetch(`/favorites`, {
      method: 'POST', // Use 'POST' to add to favorites
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      },
      body: JSON.stringify({ recipe_id: recipeId }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          console.log(`Recipe added to favorites.`);
          card.remove(); // Remove the card after liking it
        } else {
          console.error(`Failed to add the recipe to favorites.`);
        }
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }
}
