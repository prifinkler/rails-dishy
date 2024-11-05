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
      card.style.zIndex = this.cardTargets.length - index
      card.style.transform = 'scale(' + (20 - index) / 20 + ') translateY(-' + 35 * index + 'px)'
      card.style.opacity = (10 - index) / 10
    })

    this.element.classList.add('loaded')
  }

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

  handlePan(event, el) {
    if (event.deltaX === 0) return
    if (event.center.x === 0 && event.center.y === 0) return

    this.element.classList.toggle('swiper_love', event.deltaX > 0)
    this.element.classList.toggle('swiper_nope', event.deltaX < 0)

    const xMulti = event.deltaX * 0.03
    const yMulti = event.deltaY / 80
    const rotate = xMulti * yMulti

    event.target.style.transform = 'translate(' + event.deltaX + 'px, ' + event.deltaY + 'px) rotate(' + rotate + 'deg)'
  }

  handlePanEnd(event, el) {
    el.classList.remove('moving')
    this.element.classList.remove('swiper_love')
    this.element.classList.remove('swiper_nope')

    const moveOutWidth = document.body.clientWidth * 2
    const keep = Math.abs(event.deltaX) < 20 || Math.abs(event.velocityX) < 0.5

    if (!keep && event.deltaX > 0) {
      const recipeId = el.getAttribute('data-recipe-id')
      if (recipeId) {
        this.toggleFavorite(recipeId)
      }
    }

    event.target.classList.toggle('removed', !keep)

    if (keep) {
      event.target.style.transform = ''
    } else {
      this.moveCard(event)
      this.initCards()
    }
  }

  moveCard(event) {
    const moveOutWidth = document.body.clientWidth * 2
    const endX = Math.max(Math.abs(event.velocityX) * moveOutWidth, moveOutWidth)
    const toX = event.deltaX > 0 ? endX : -endX
    const endY = Math.abs(event.velocityY) * moveOutWidth
    const toY = event.deltaY > 0 ? endY : -endY
    const xMulti = event.deltaX * 0.03
    const yMulti = event.deltaY / 80
    const rotate = xMulti * yMulti

    event.target.style.transform = 'translate(' + toX + 'px, ' + (toY + event.deltaY) + 'px) rotate(' + rotate + 'deg)'
  }

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

  applyAnimationToCardAtIndex(index) {
    this.cardTargets.forEach((card, cardIndex) => {
      if (cardIndex === index) {
        const path = card.querySelector(".path")
        const handIcon = card.querySelector(".hand-icon")
        if (path) path.style.animation = "swipe-dot 2s 0.5s infinite"
        if (handIcon) handIcon.style.animation = "swipe-hand 2s infinite"
      } else {
        const handIcon = card.querySelector(".hand-icon")
        if (handIcon) handIcon.style.display = "none"
      }
    })
  }
}
