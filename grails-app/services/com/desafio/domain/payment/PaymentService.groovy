package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer

import grails.gorm.transactions.Transactional 

@Transactional
class PaymentService {

    public Payment save(Map params) {
        Payment payment = new Payment(params)
        payment.customer = Customer.get(params.long("customerId"))
        payment.payer = Payer.get(params.long("payerId"))
        payment.save(failOnError: true)
        return payment
     }
}