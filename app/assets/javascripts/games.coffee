# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  questionsDomElement = $(".questions")

  $("#addQuestion").on "click", (e) ->
    numQuestions = $(".questions").children("input").length
    newQuestionNumber = numQuestions + 1
    newQuestion = "<label for='game_question_#{newQuestionNumber + 1}'>Question #{newQuestionNumber}</label>
      <input id='game_question_#{newQuestionNumber + 1}' name='game[question_#{newQuestionNumber + 1}]' type='text'>"

    questionsDomElement.append newQuestion
    numQuestions++
