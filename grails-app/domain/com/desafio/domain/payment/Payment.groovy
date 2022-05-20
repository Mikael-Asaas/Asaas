package com.desafio.domain.payment

import com.desafio.base.BaseEntity
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentStatus
import com.desafio.enums.PaymentMethod

class Payment extends BaseEntity {

    PaymentMethod method
    
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
