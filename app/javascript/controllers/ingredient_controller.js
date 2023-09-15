import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input', 'listItem'];

  connect() {
    console.log('Connected to ingredient controller');
  }

  addIngredient() {
    // console.log('Connected to addIngredient ');

    const ingredientInput = this.inputTarget;
    const selectedIngredientsList = this.listItemTarget;

    const ingredient = ingredientInput.value;
    if (ingredient) {
      const capitalizedIngredient = this.capitalizeFirstLetter(ingredient);
      const listItem = document.createElement('li');
      listItem.textContent = capitalizedIngredient;
      selectedIngredientsList.appendChild(listItem);
      ingredientInput.value = '';
    }
  }

  removeIngredient(event) {
    event.target.remove();
  }

  capitalizeFirstLetter(str) {
    return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
  }
}
