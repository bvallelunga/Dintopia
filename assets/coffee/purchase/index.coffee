$ ->
   $(".purchase").hAlign().vAlign()
   $('.input-expiration').payment('formatCardExpiry')
   $('.input-cvc').payment('formatCardCVC')
   $('.input-card')
      .payment('formatCardNumber')
      .keyup ->
         type = $.payment.cardType $(@).val()

         if type and type != "Unknown"
            $(".new-card .logo")
               .attr("src", "/img/cards/#{type.toLowerCase().replace(" ", "")}.png")
               .load ->
                  $(".new-card .logo").fadeIn 200
         else
            $(".new-card .logo").fadeOut 200

   $(".purchase form").submit (e)->
      e.preventDefault()
      e.stopPropagation()

      form = $(@)

      $.post form.attr("action"), form.serialize(), (response)->
         if response.success
            window.location.href = response.next;
         else
            form
               .find(".button")
               .addClass("error")
               .val(response.error_message)
