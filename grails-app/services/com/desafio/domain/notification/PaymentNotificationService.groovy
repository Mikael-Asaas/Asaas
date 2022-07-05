package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer

import grails.gorm.transactions.Transactional 
import grails.plugin.asyncmail.AsynchronousMailService
import grails.gsp.PageRenderer

@Transactional
class PaymentNotificationService {
    
    PageRenderer groovyPageRenderer
    def emailService

    public void notifyCreatedPayment(Payment payment) {
        String subject = "Asaas - Nova cobrança"
        emailService.sendEmail(payment.customer.email, subject, groovyPageRenderer.render(template: "/email/createdPaymentCustomerNotification", model: [payment: payment]))
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/createdPaymentPayerNotification", model: [payment: payment]))
    }

    public void notifyConfirmedPayment(Payment payment) {
        String  subject = "Asaas - Pagamento confirmado"
        emailService.sendEmail(payment.customer.email, subject, groovyPageRenderer.render(template: "/email/confirmedPaymentCustomerNotification", model: [payment: payment]))
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/confirmedPaymentPayerNotification", model: [payment: payment]))
    }

    public void notifyOverduePayment(Payment payment) {
        String  subject = "Asaas - Cobrança vencida"
        emailService.sendEmail(payment.payer.email, subject, groovyPageRenderer.render(template: "/email/overduePaymentPayerNotification", model: [payment: payment]))
    }
}