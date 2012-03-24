# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $(".duplicate-submission").hide()
    $(".show-dupes").click (e)->
        e.preventDefault()
        $this = $(this)
        $("#submissions_by_#{$this.data('id')}.duplicate-submission").toggle(300, ->
            if $(this).is(":visible")
                $this.text("(hide)")
            else
                $this.text("(show)")
        )
