package com.desafio.enums

enum PaymentMethod {
    BILL_OF_PAY,
    CARD,
    TRANSFER

    public static PaymentMethod convert(paymentMethod) {
        try {
            if(paymentMethod instanceof String) paymentMethod = paymentMethod.toUpperCase()
            return paymentMethod as PaymentMethod
        } catch(Exception e) {
            return null
        }
    }
}

