package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentStatus
import com.desafio.enums.PaymentMethod

import grails.validation.ValidationException
import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.gsp.PageRenderer
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])

class PaymentController extends BaseController {
    
    def springSecurityService
    def paymentService
    
    def index() {
        Customer customer = springSecurityService.getCurrentUser().customer 
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("customer", customer)
        }
        return [customer: customer, paymentList: paymentList, totalCount: paymentList.size()]
    }

    def create() {
          Long customerId = params.long("customerId")
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

    def confirm() {
        try {
            Long paymentId = params.long("paymentId")
            Payment payment = paymentService.confirmPayment(paymentId)
            
            if (payment) {
                redirect (controller: "payment", action: "index", params: [customerId: payment.customerId])
                return
            }
        } catch (Exception exception) {
            redirect action: "index"
            flash.message = "Erro ao confirmar cobrança"
        }
    }

    def show() { 
        return [payment: Payment.get(params.long('paymentId'))]
    }
}
