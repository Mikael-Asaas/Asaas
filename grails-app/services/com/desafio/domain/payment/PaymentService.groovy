package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentMethod
import com.desafio.enums.PaymentStatus
import com.desafio.utils.DateUtils
import grails.gorm.transactions.Transactional 

@Transactional
class PaymentService {

    public Payment save(Map params) {
        Payment payment = new Payment()
        payment.value = new BigDecimal(params.value)
        payment.status = PaymentStatus.PENDING
        payment.billingType = PaymentMethod.valueOf(params.billingType)
        payment.dueDate = DateUtils.formatStringToDate(params.dueDate, "yyyy-MM-dd")
        payment.customer = Customer.get(Long.valueOf(params.customerId))
        payment.payer = Payer.get(Long.valueOf(params.payerId))
        payment.save(failOnError: true)
        return payment
    }
}
