package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentMethod
import com.desafio.enums.PaymentStatus
import com.desafio.utils.DateUtils
import com.desafio.domain.EmailService
import com.desafio.utils.DomainUtils
import com.desafio.utils.ValidateUtils

import grails.gorm.transactions.Transactional 
import grails.plugin.asyncmail.AsynchronousMailService
import grails.gsp.PageRenderer

@Transactional
class PaymentService {

    PageRenderer groovyPageRenderer
    def emailService

    public Payment save(Map params) {
        Payment payment = new Payment()
        payment = validate(payment, params)
        if (payment.hasErrors()) return payment
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

    public Payment verifyDueDates() {
        Date yesterday = DateUtils.getYesterday()
        List<Payment> paymentList = list(PaymentStatus.PENDING, yesterday)
        for(Payment payment : paymentList) {
            payment.status = PaymentStatus.OVERDUE
            payment.save(failOnError:true)
        }
    }
    
    public void newPaymentNotify(Payment payment) {
        String subject = "Asaas - Nova cobrança"
        emailService.sendEmail(payment.customer.email, subject, groovyPageRenderer.render(template: "/email/sendCustomerEmail", model: [payment: payment]))
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/sendPayerEmail", model: [payment: payment]))
    }

    public void confirmPaymentNotify(Payment payment) {
        String  subject = "Asaas - Pagamento confirmado"
        emailService.sendEmail(payment.customer.email, subject, groovyPageRenderer.render(template: "/email/confirmCustomerEmail", model: [payment: payment]))
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/confirmPayerEmail", model: [payment: payment]))
    }

    public Payment validate(Payment payment, Map params) {
        if (!ValidateUtils.validateMinValue(params.value)) {
            DomainUtils.addError(payment, "Cobrança mínima de R$5.00")
        }

        if (!ValidateUtils.isNotNull(params.payerId)) {
            DomainUtils.addError(payment, "Cliente inválido")
        }

        if (!ValidateUtils.validatePaymentMethod(params.method)) {
            DomainUtils.addError(payment, "Método de pagamento inválido")
        }
        
        if (!ValidateUtils.validatePaymentDueDate(params.dueDate)){
             DomainUtils.addError(payment, "Data de vencimento inválida")
        }
        return payment
    }
}
