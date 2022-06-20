package com.desafio.domain

import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentMethod
import com.desafio.enums.PaymentStatus
import com.desafio.utils.DateUtils
import grails.gorm.transactions.Transactional 

@Transactional
class PaymentService {

    public Payment save(Map params) {
        Payment payment = new Payment()
        payment.value = new BigDecimal(params.value)
        payment.status = PaymentStatus.PENDING
        payment.method = PaymentMethod.valueOf(params.method)
        payment.dueDate = DateUtils.formatStringToDate(params.dueDate, "yyyy-MM-dd")
        payment.customer = Customer.get(Long.valueOf(params.customerId))
        payment.payer = Payer.get(Long.valueOf(params.payerId))
        payment.save(failOnError: true)
        return payment
    }

    public Payment confirmPayment(Long paymentId) {
        Payment payment = Payment.get(paymentId)
        if (payment.status != PaymentStatus.PENDING) throw new Exception("Somente podem ser confirmadas cobranças que estejam pendentes de recebimento")
        payment.status = PaymentStatus.PAID
        payment.save(failOnError: true)
        return payment
    }

    public List<Payment> list(PaymentStatus paymentStatus, Date dueDate) {
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
            payment.status = PaymentStatus.OVERDUE
            payment.save(failOnError:true)
        }
    }
}
