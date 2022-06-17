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

    def paymentNotificationService

    public Payment save(Map params) {
        Payment payment = new Payment()
        payment = validate(payment, params)
        if (payment.hasErrors()) return payment

        payment.value = new BigDecimal(params.value)
        payment.status = PaymentStatus.PENDING
        payment.method = PaymentMethod.valueOf(params.method)
        payment.dueDate = DateUtils.formatStringToDate(params.dueDate, "yyyy-MM-dd")
        payment.customer = Customer.get(Long.valueOf(params.customerId))
        payment.payer = Payer.get(Long.valueOf(params.payerId))
        payment.save(failOnError: true)

        paymentNotificationService.notifyNewPayment(payment)

        return payment
    }

    public Payment confirmPayment(Long paymentId) {
        Payment payment = Payment.get(paymentId)
        if (payment.status != PaymentStatus.PENDING) throw new Exception("Somente podem ser confirmadas cobranças que estejam pendentes de recebimento")
        payment.status = PaymentStatus.PAID
        payment.paymentDate = new Date()
        payment.save(flush: true, failOnError: true)

        paymentNotificationService.notifyConfirmPayment(payment)
        
        return payment
    }

    public List<Payment> list(PaymentStatus paymentStatus, Date date) {
        List<Payment> paymentList = Payment.createCriteria().list() {
            eq("status", paymentStatus)
            le("dueDate", date)
        }
        return paymentList
    }

    public Payment updateToOverdue() {
        Date date = DateUtils.getYesterday()
        List<Payment> paymentList = list(PaymentStatus.PENDING, date)
        for (Payment payment : paymentList) {
            setAsOverdue();
        }
    }
    
    public Payment setAsOverdue() { 
        payment.status = PaymentStatus.OVERDUE
        payment.save(failOnError:true)

        paymentNotificationService.notifyOverduePayment(); 
    }

    public Payment validate(Payment payment, Map params) {
        Payment validatedPayment = new Payment()
        if (!ValidateUtils.validateMinValue(params.value)) {
            DomainUtils.addError(validatedPayment, 'O valor mínimo para cobranças é R$ 5,00')
        }

        if (!ValidateUtils.isNotNull(params.payerId)) {
            DomainUtils.addError(validatedPayment, "Cliente não informado")
        }

        if (!PaymentMethod.convert(params.billingType)) {
            DomainUtils.addError(validatedPayment, "Forma de pagamento não informada")
        }
        
        if (!ValidateUtils.validatePaymentDueDate(params.dueDate)){
             DomainUtils.addError(validatedPayment, "Data de vencimento inválida")
        }
        return payment
    }
}
