package com.desafio.domain

import com.desafio.base.BaseEntity
import com.desafio.domain.Payer
import com.desafio.domain.Customer
import com.desafio.enums.PaymentStatus
import com.desafio.enums.PaymentMethod

class Payment extends BaseEntity {

    PaymentMethod method
    
    PaymentStatus status

    BigDecimal value

    String Description

    Date DueDate

    Date paymentDate

    Payer Payer

    Customer Customer

    static constraints = {
        value min: 5.00
        paymentDate nullable: true
    }    
}
