package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer

import grails.converters.JSON

class PaymentController extends BaseController {
    
    def paymentService

    def index() {
        Long customerId = params.long("id")
        List<Payment> paymentList = Payment.createCriteria().list(max: getLimitPage(), offset: getCurrentPage()) {
            eq("customer", Customer.get(customerId)) 
        }
        return [paymentList: paymentList, totalCount: Payment.count()]
    }

    def create() {
        Long customerId = params.long("id")
        List<Payer> payerList = Payer.createCriteria().list() {
            eq("customer", Customer.get(customerId)) 
        }
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
            render([success: false, message: message(code: "unknow.error")] as JSON)
        }
    }
}