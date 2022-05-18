package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentMethod
import com.desafio.enums.PaymentStatus

import grails.gorm.transactions.Transactional
import java.math.BigDecimal

@Transactional
class PaymentService {

    public Payment save(Map params) {
        Payment payment = new Payment(params)
        payment.method = PaymentMethod.valueOf(params.method)
        payment.status = PaymentStatus.PENDING
        payment.value = new BigDecimal(params.value)
        payment.description = params.description
        payment.dueDate = params.dueDate
        payment.payer = Payer.get(params.payerId)
        payment.customer = Customer.get(params.customerId)
    }
}