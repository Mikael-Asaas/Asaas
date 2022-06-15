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
    def emailService

    public Payment save(Map params) {
        Payment payment = new Payment()
        payment.value = new BigDecimal(params.value)
        payment.status = PaymentStatus.PENDING
        payment.method = PaymentMethod.valueOf(params.method)
        payment.dueDate = DateUtils.formatStringToDate(params.dueDate, "yyyy-MM-dd")
        payment.customer = Customer.get(params.long("customerId"))
        payment.payer = Payer.get(params.long("payerId"))
        payment.save(failOnError: true)

        newPaymentNotify(payment)

        return payment
    }

    public Payment confirmedPayment(Long paymentId) {
        Payment payment = Payment.get(paymentId)
        payment.status = PaymentStatus.PAID
        payment.paymentDate = new Date()
        payment.save(flush: true, failOnError: true)

        confirmPaymentNotify(payment)
        
        return payment
    }

    public List<Payment> list(PaymentStatus paymentStatus, Date yesterday) {
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("status", paymentStatus)
            le("dueDate", yesterday)
        }
        return paymentList
    }

    public Payment updateToOverdue() {
        Date yesterday = DateUtils.getYesterday()
        List<Payment> paymentList = list(PaymentStatus.PENDING, yesterday)
        for (Payment payment : paymentList) {
            payment.status = PaymentStatus.OVERDUE
            payment.save(failOnError:true)
        }
    }
    
    public void newPaymentNotify(Payment payment) {
        String subject = "Asaas - Nova cobrança"
        emailService.sendEmail(payment.customer.email, subject, groovyPageRenderer.render(template: "/email/createdPaymentCustomerNotification", model: [payment: payment]))
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/createdPaymentPayerNotification", model: [payment: payment]))
    }

    public void confirmPaymentNotify(Payment payment) {
        String  subject = "Asaas - Pagamento confirmado"
        emailService.sendEmail(payment.customer.email, subject, groovyPageRenderer.render(template: "/email/confirmedPaymentCustomerNotification", model: [payment: payment]))
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/confirmedPaymentPayerNotification", model: [payment: payment]))
    }
}
