package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentMethod
import com.desafio.enums.PaymentStatus
import com.desafio.utils.DateUtils

import grails.gorm.transactions.Transactional 
import grails.plugin.asyncmail.AsynchronousMailService
import grails.gsp.PageRenderer

@Transactional
class PaymentService {

    PageRenderer groovyPageRenderer
    def asynchronousMailService

    public Payment save(Map params) {
        Payment payment = new Payment()
        payment.value = new BigDecimal(params.value)
        payment.status = PaymentStatus.PENDING
        payment.method = PaymentMethod.valueOf(params.method)
        payment.dueDate = DateUtils.formatStringToDate(params.dueDate, "yyyy-MM-dd")
        payment.customer = Customer.get(params.long("customerId"))
        payment.payer = Payer.get(params.long("payerId"))
        payment.save(failOnError: true)
        asynchronousMailService.sendMail {
            to payment.payer.email
            subject "Nova cobrança"
            html groovyPageRenderer.render(template:"/email/sendPayerEmail", model: [payment: payment])
        }
        asynchronousMailService.sendMail {
            to payment.customer.sendMail
            subject "Nova cobrança"
            html groovyPageRenderer.render(template:"/email/sendCustomerEmail", model: [payment: payment])
        }
        return payment
    }

    public Payment confirmedPayment(Long paymentId) {
        Payment payment = Payment.get(paymentId)
        payment.status = PaymentStatus.PAID
        payment.save(flush: true, failOnError: true)
        asynchronousMailService.sendMail {
            to payment.payer.email
            subject "Pagamento recebido"
            html groovyPageRenderer.render(template:"/email/confirmPayerEmail", model: [payment: payment])
        }
        asynchronousMailService.sendMail {
            to payment.customer.email
            subject "Pagamento recebido"
            html groovyPageRenderer.render(template:"/email/confirmCustomerEmail", model: [payment: payment])
        }
        return payment
    }

    public List<Payment> returnPaymentStatusAndDate(PaymentStatus paymentStatus, Date yesterdayDate) {
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("status", paymentStatus)
            ge("dueDate", yesterdayDate)
        }
        return paymentList
    }
}