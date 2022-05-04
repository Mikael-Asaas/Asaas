package com.desafio.domain

import com.desafio.domain.payment.Payment
import grails.gorm.transactions.Transactional

@Transactional
class PaymentService {

    def save (Map params) {
        Payment payment = new Payment(params)
        payment.save(failOnError: true)
    }

    def getPayment(Integer id) {
        return Payment.get(id)
    }

}
