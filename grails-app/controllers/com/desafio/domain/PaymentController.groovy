package com.desafio.domain

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import com.desafio.domain.payment.Payment
// import grails.converters.JSON

class PaymentController {

    def paymentService

    def create() {}

    def index() {
        return[paymentList: Payment.list(max: 10, offset: getCurrentPage()), totalCount: Payment.count()]
    }

    private Integer getCurrentPage() {
        if(!params.offset) params.offset = 0
        return Integer.valueOf(params.offset)
    }

    def save() {
        paymentService.save(params)
        render("Pagador salvo")
    }

    def show() {
        return [payment: paymentService.getPayment(params.int("id"))]
    }
}

