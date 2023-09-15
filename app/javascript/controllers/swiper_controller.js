import { Controller } from "@hotwired/stimulus";
import Hammer from 'hammerjs';

export default class extends Controller {
  connect() {
    console.log('Swiper controller connected');

    const swiperContainer = this.element;
    const allCards = this.element.querySelectorAll('.swiper--card');
    const nope = this.element.querySelector('#nope');
    const love = this.element.querySelector('#love');

    this.initCards(allCards, swiperContainer);

    allCards.forEach((el) => {
      console.log('allCards connected');

      const hammertime = new Hammer(el);

      hammertime.on('pan', (event) => {
        el.classList.add('moving');
      });

      hammertime.on('pan', (event) => {
        if (event.deltaX === 0) return;
        if (event.center.x === 0 && event.center.y === 0) return;

        swiperContainer.classList.toggle('swiper_love', event.deltaX > 0);
        swiperContainer.classList.toggle('swiper_nope', event.deltaX < 0);

        const xMulti = event.deltaX * 0.03;
        const yMulti = event.deltaY / 80;
        const rotate = xMulti * yMulti;

        event.target.style.transform = `translate(${event.deltaX}px, ${event.deltaY}px) rotate(${rotate}deg)`;
      });

      hammertime.on('panend', (event) => {
        el.classList.remove('moving');
        swiperContainer.classList.remove('swiper_love');
        swiperContainer.classList.remove('swiper_nope');

        const moveOutWidth = document.body.clientWidth;
        const keep = Math.abs(event.deltaX) < 80 || Math.abs(event.velocityX) < 0.5;

        event.target.classList.toggle('removed', !keep);

        if (keep) {
          event.target.style.transform = '';
        } else {
          const endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth);
          const toX = event.deltaX > 0 ? endX : -endX;
          const endY = Math.abs(event.velocityY) * moveOutWidth;
          const toY = event.deltaY > 0 ? endY : -endY;
          const xMulti = event.deltaX * 0.03;
          const yMulti = event.deltaY / 80;
          const rotate = xMulti * yMulti;

          event.target.style.transform = `translate(${toX}px, ${(toY + event.deltaY)}px) rotate(${rotate}deg)`;
          this.initCards(allCards, swiperContainer);
        }
      });
    });

    nope.addEventListener('click', (event) => {
      this.createButtonListener(event, false);
    });

    love.addEventListener('click', (event) => {
      this.createButtonListener(event, true);
    });
  }

  initCards(cards, container) {
    console.log('initCards  connected'); //This is connected ok and appearing on the console
    // console.log('Card count:', newCards.length);

    const newCards = [...cards].filter((card) => !card.classList.contains('removed'));

    newCards.forEach((card, index) => { // THE PROBLEM IS HERE - in the newCards from line 78, that's what messing with the stacking
      console.log('newCards connected'); //This is not logging on the console

      card.style.zIndex = cards.length - index;
      card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 30 * index + 'px)';
      card.style.opacity = (10 - index) / 10;
    });

    container.classList.add('loaded');
  }

  createButtonListener(event, love) {
    console.log('createButton connected');

    const cards = this.element.querySelectorAll('.swiper--card:not(.removed)');
    const moveOutWidth = document.body.clientWidth * 1.5;

    if (!cards.length) return false;

    const card = cards[0];

    card.classList.add('removed');

    if (!love) {
      card.style.transform = `translate(-${moveOutWidth}px, -100px) rotate(30deg)`;
    }

    this.initCards([...cards], this.element);

    const recipeId = card.dataset.recipeId;
    this.addToFavorites(recipeId, love);

    event.preventDefault();
  }

  addToFavorites(recipeId, love) {
    console.log('addToFavourites connected');

    fetch(`/favourites`, {
      method: love ? 'POST' : 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      },
      body: JSON.stringify({ recipe_id: recipeId }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          console.log(`Recipe ${love ? 'added to' : 'removed from'} favorites.`);
        } else {
          console.error(`Failed to ${love ? 'add to' : 'remove from'} favorites.`);
        }
      })
      .catch((error) => {
        console.error('Error:', error);
      });
  }
}
