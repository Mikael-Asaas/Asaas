package com.desafio.domain

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import com.desafio.domain.payment.Payment
// import grails.converters.JSON

class PaymentController {

    def paymentService

    def create() {}

    def save() {
        paymentService.save(params)
        render("Pagador salvo")
    }
}
