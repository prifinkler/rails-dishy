import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]

  connect() {
    // console.log("Swiper controller connected!")
    if (typeof Hammer === 'undefined') {
      console.error('Hammer.js not loaded!')
      return
    }
    this.initCards()
    this.initializeHammer()
    this.applyAnimationToCardAtIndex(0)
  }

  initCards() {
    // console.log("Initializing cards...")
    const newCards = this.cardTargets.filter(card => !card.classList.contains('removed'))

    newCards.forEach((card, index) => {
      // set the stack order (higher z-index = more on top)
      card.style.zIndex = this.cardTargets.length - index
      // make cards smaller and move them down as they go back in the stack:
      card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 35 * index + 'px)'
      // make cards more transparent as they go back
      card.style.opacity = (10 - index) / 10
    })

    // show the stack of cards
    this.element.classList.add('loaded')
  }

  // set up touch detection for each card
  initializeHammer() {
    // console.log("Initializing Hammer.js...")
    this.cardTargets.forEach((el) => {
      const hammertime = new Hammer(el)

      hammertime.on('pan', (event) => {
        el.classList.add('moving')
        this.handlePan(event, el)
      })

      hammertime.on('panend', (event) => {
        this.handlePanEnd(event, el)
      })
    })
  }

  // handle card while it's being swiped
  handlePan(event, el) {
    // if there's no movement, do nothing
    if (event.deltaX === 0) return
    if (event.center.x === 0 && event.center.y === 0) return

    // show like/dislike icons based on swipe direction
    this.element.classList.toggle('swiper_love', event.deltaX > 0)
    this.element.classList.toggle('swiper_nope', event.deltaX < 0)

    // calculate how much to rotate the card
    const xMulti = event.deltaX * 0.03
    const yMulti = event.deltaY / 80
    const rotate = xMulti * yMulti

    // move the card with the finger/mouse
    event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)'
  }

  // handle what happens when user stops swiping
  handlePanEnd(event, el) {
    // remove movement-related classes
    el.classList.remove('moving')
    this.element.classList.remove('swiper_love')
    this.element.classList.remove('swiper_nope')

    // calculate if card should be removed
    const moveOutWidth = document.body.clientWidth * 2
    const keep = Math.abs(event.deltaX) < 20 || Math.abs(event.velocityX) < 0.5

    // if swiped right far enough, favourite the recipe
    if (!keep && event.deltaX > 0) {
      const recipeId = el.getAttribute('data-recipe-id')
      if (recipeId) {
        this.toggleFavorite(recipeId)
      }
    }

    // mark card as removed if swiped far enough
    event.target.classList.toggle('removed', !keep)

    if (keep) {
      // reset card position if not swiped far enough
      event.target.style.transform = ''
    } else {
      // move card out if swiped far enough
      this.moveCard(event)
      this.initCards()
    }
  }

  // calculate final position for card being removed
  moveCard(event) {
    const moveOutWidth = document.body.clientWidth * 2
    const endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth)
    const toX = event.deltaX > 0 ? endX : -endX
    const endY = Math.abs(event.velocityY) * moveOutWidth
    const toY = event.deltaY > 0 ? endY : -endY
    const xMulti = event.deltaX * 0.03
    const yMulti = event.deltaY / 80
    const rotate = xMulti * yMulti

    // move card out
    event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)'
  }

  // send favorite/unfavorite request to server
  async toggleFavorite(recipeId) {
    try {
      const response = await fetch(`/recipes/${recipeId}/toggle_favorite`, {
        method: 'POST',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
          'Content-Type': 'application/json'
        },
      })
      const data = await response.json()
      if (data.status === 'success') {
        console.log('Favorite toggled successfully')
      }
    } catch (error) {
      console.error('Error:', error)
    }
  }

  // show swipe tutorial animation (first card only)
  applyAnimationToCardAtIndex(index) {
    this.cardTargets.forEach((card, cardIndex) => {
      // add animation to first card
      if (cardIndex === index) {
        const path = card.querySelector(".path")
        const handIcon = card.querySelector(".hand-icon")
        if (path) path.style.animation = "swipe-dot 2s 0.5s infinite"
        if (handIcon) handIcon.style.animation = "swipe-hand 2s infinite"
      } else {
        // hide animation from other cards
        const handIcon = card.querySelector(".hand-icon")
        if (handIcon) handIcon.style.display = "none"
      }
    })
  }
}
