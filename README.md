# Dishy: Recipe Matching App

A Rails application for discovering recipes through a Tinder-style interface, making meal planning fun and interactive.

## Features
* 👆 Swipe through curated recipes
* 🎯 Match with recipes based on preferences
* ❤️ Save favorite recipes
* 🍳 Set cuisine preferences
* 🥗 Manage dietary requirements
* 📱 Mobile-first design with intuitive interface

## Technical Details
* Built with Ruby on Rails 7.0
* Uses PostgreSQL database
* Implements Stimulus.js for swipe functionality
* Uses Hammer.js for touch gestures
* Styled with Bootstrap and custom SCSS
* Uses Devise for user authentication
* JavaScript managed through importmap-rails

## Setup
1. Clone the repository
2. Run `bundle install`
3. Set up the database with `rails db:create db:migrate db:seed`
4. Start the server with `rails server`

## Environment Variables
Make sure to set up the following environment variables:
* `DATABASE_URL`: Your PostgreSQL database credentials
* `RAILS_ENV`: Your Rails environment (development/production)

## Key Models
* `User`: Manages user accounts and preferences
* `Recipe`: Represents recipes available for matching
* `Ingredient`: Stores recipe ingredients
* `UserPreference`: Handles user cuisine and dietary preferences
* `Favorite`: Manages user's liked recipes

This mobile-first application helps users discover recipes through an engaging swipe interface, making recipe selection both fun and efficient.
