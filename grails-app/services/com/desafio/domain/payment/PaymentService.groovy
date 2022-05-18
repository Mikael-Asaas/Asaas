package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentMethod
import com.desafio.enums.PaymentStatus

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

    public Payment update(Long id, Map params) {
        if (!id) throw new Exception("Erro ao realizar atualização de informação")
        Payment payment = Payment.get(id)
        payment.value = params.value
        payment.method = params.method
        payment.status = params.status
        payment.dueDate = params.dueDate
        payment.customer = params.customer
        payment.payer = params.payer
        payment.save(failOnError: true)
        return payment
    }
}