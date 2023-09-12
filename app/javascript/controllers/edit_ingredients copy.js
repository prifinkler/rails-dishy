
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>;
<script>
  $(document).ready(function() {
    $('.add-ingredient-button').click(function() {
      console.log('Button clicked'); // Log a message when the button is clicked
      var ingredient = $('.ingredient-input').val();
      if (ingredient.trim() !== '') {
        // Create a new list item and append it to the selected-ingredients-list
        var listItem = $('<li>').text(ingredient);
        $('#selected-ingredients-list').append(listItem);

        // Clear the input field
        $('.ingredient-input').val('');
      }
    })
  });
</script>
