package com.desafio.domain.payment

import com.desafio.base.BaseEntity
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentStatus

class Payment extends BaseEntity {
    
    PaymentStatus status

    BigDecimal value

    Date dueDate

    Date paymentDate

    Payer payer

    Customer customer

    static constraints = {
        paymentDate nullable: true
    }    
}
