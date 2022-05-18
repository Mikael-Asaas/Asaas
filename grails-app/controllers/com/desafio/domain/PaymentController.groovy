package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer

import grails.converters.JSON
import grails.gorm.PagedResultList

class PaymentController {
    
    def paymentService

   def index() {  
        Long customerId = params.long("id")
        PagedResultList paymentList =  Payment.createCriteria().list(max: getLimitPage(), offset: getCurrentPage()){
            like("customer", Customer.get(customerId)) 
        }
        return [paymentList: paymentList, totalCount: Payment.count()]
    }

    def create() {
        Long customerId = params.long("id")
        PagedResultList payerList =  Payer.createCriteria().list() {
            like("customer", Customer.get(customerId)) 
        }
        [payerList: payerList, totalCount: Payer.count()]
        return [customerId: customerId, payerList: payerList]
    }

    def save() {
        try {
            Payment payment = paymentService.save(params) 
            if (payment.hasErrors()) {
                render([success: false, message: message(code: payment.errors.allErrors[0].defaultMessage ?: payment.errors.allErrors[0].codes[0])] as JSON)
                return
            }
            render([success: true] as JSON)
        } catch (Exception exception) {
            render([success: false, message: message(code: 'unknow.error')] as JSON)
        }
    }
}