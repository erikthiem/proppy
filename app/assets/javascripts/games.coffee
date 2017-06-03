# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  questionsDomElement = $(".questions")

  

  newQuestion = '<label for="game_question_1">Question 1</label>
    <input id="game_question_1" name="game[question_1]" type="text">'

  $("#addQuestion").on "click", (e) ->
    questionsDomElement.append newQuestion
