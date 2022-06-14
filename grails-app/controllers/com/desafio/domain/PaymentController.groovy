package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentMethod

import grails.converters.JSON
import grails.gorm.PagedResultList

class PaymentController extends BaseController {
    
    def paymentService

    def index() {
        Long customerId = Long.valueOf(params.customerId)
        PagedResultList paymentList = Payment.createCriteria().list(max: getLimitPage(), offset: getCurrentPage()) {
            eq("customer", Customer.get(customerId)) 
        }
        return [paymentList: paymentList, totalCount: paymentList.totalCount]
    }

    def create() {
        Long customerId = Long.valueOf(params.customerId)
        List<Payer> payerList = Payer.createCriteria().list() {
            eq("customer", Customer.get(customerId)) 
        }
        return [customerId: customerId, payerList: payerList, totalCount: Payer.count()]
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

    def confirm() {
        try {
            Long paymentId = params.long("paymentId")
            Payment payment = paymentService.confirmPayment(paymentId)
            
            if (payment) {
                redirect (controller: "payment", action: "index", params: [customerId: payment.customerId])
            return
            }
        } catch (Exception exception) {
            render([sucess: false, message: message(code: "unknow.error")] as JSON)
        }
    }

    def show() {
        return [payment: Payment.get(params.long('paymentId'))]
    }
}
