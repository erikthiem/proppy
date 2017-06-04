# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  questionsDomElement = $(".questions")

  $("#addQuestion").on "click", (e) ->
    numQuestions = $("input.question").length
    newQuestionNumber = numQuestions + 1

    newQuestion = "<label for='game_question_#{newQuestionNumber}'>Question #{newQuestionNumber}</label>
      <input class='question' id='game_question_#{newQuestionNumber}' name='game[question_#{newQuestionNumber}]' type='text'>"

    newQuestionResponse1 = "<label for='game_question_#{newQuestionNumber}_response_1'>Response 1</label>
      <input id='game_question_#{newQuestionNumber}_response_1' name='game[question_#{newQuestionNumber}_response_1]' type='text'>"

    newQuestionResponse2 = "<label for='game_question_#{newQuestionNumber}_response_2'>Response 2</label>
      <input id='game_question_#{newQuestionNumber}_response_2' name='game[question_#{newQuestionNumber}_response_2]' type='text'>"

    newQuestionHtmlChunk = "#{newQuestion}#{newQuestionResponse1}#{newQuestionResponse2}"

    questionsDomElement.append newQuestionHtmlChunk
