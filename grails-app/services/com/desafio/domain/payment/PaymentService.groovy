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

    def paymentNotificationService

    public Payment save(Map params) {
        Payment payment = new Payment()
        payment.value = new BigDecimal(params.value)
        payment.status = PaymentStatus.PENDING
        payment.billingType = PaymentMethod.valueOf(params.billingType)
        payment.dueDate = DateUtils.formatStringToDate(params.dueDate, "yyyy-MM-dd")
        payment.customer = Customer.get(Long.valueOf(params.customerId))
        payment.payer = Payer.get(Long.valueOf(params.payerId))
        payment.save(failOnError: true)

        paymentNotificationService.notifyNewPayment(payment)

        return payment
    }

    public Payment confirmPayment(Long paymentId) {
        Payment payment = Payment.get(paymentId)
        payment.status = PaymentStatus.PAID
        payment.paymentDate = new Date()
        payment.save(flush: true, failOnError: true)

        paymentNotificationService.notifyConfirmPayment(payment)
        
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
            setAsOverdue();
        }
    }
    
    public Payment setAsOverdue() { 
        payment.status = PaymentStatus.OVERDUE
        payment.save(failOnError:true)

        paymentNotificationService.notifyOverduePayment(); 
    }
}
