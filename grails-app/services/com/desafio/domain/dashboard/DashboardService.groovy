package com.desafio.domain

import com.desafio.enums.PaymentStatus
import com.desafio.base.BaseController
import com.desafio.domain.payment.Payment
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.enums.PaymentMethod

import grails.converters.JSON
import grails.gorm.PagedResultList

class DashboardService{

    def payerService
    def customerService
    def paymentService

    public List<Payment> getPaymentsByCustomer(Long customerId, Integer max = null, Integer offset = null){
        if (max == null || offset == null) {
            List<Payment> paymentList = Payment.createCriteria().list(){
                eq("customer", Customer.get(customerId))
            }
            return paymentList
        }
        List<Payment> paymentList = Payment.createCriteria().list(max: max, offset: offset){
            eq("customer", Customer.get(customerId))
        }
        return paymentList
    }

    public List<Payer> getPayersByCustomer(Long customerId, Integer max = null, Integer offset = null) {
        def payerCriteria = Payer.createCriteria()
        if (max == null || offset == null) {
            List<Payer> payerList = payerCriteria.list() {
                eq("customer", Customer.get(customerId))
            }
            return payerList
        }
        List<Payer> payerList = payerCriteria.list(max: max, offset: offset) {
            eq("customer", Customer.get(customerId))
        }
        return payerList
    }

    public List<Payment> listPaymentByCustomerAndStatus(Long customerId, PaymentStatus paymentStatus) { 
        List<Payment> paymentList= Payment.createCriteria().list() {
            eq("status", paymentStatus)
            and {
             eq("customer", Customer.get(customerId))
            }
        }
        return paymentList
    }


    public Map getDashboardInfo(Long customerId) { 
        List<Payer> payerList = getPayersByCustomer(customerId)
        Integer totalPayers = payerList.size()
     
        List<Payment> overduePaymentList = listPaymentByCustomerAndStatus(customerId, PaymentStatus.OVERDUE)
        List<Payer> defaultersList = overduePaymentList.unique { Payment payment -> payment.payer }

        Integer defaulters = defaultersList.size()
        Integer nonDefaulters = totalPayers - defaulters

        BigDecimal received = listPaymentByCustomerAndStatus(customerId, PaymentStatus.PAID).value.sum()
        BigDecimal foreseen = listPaymentByCustomerAndStatus(customerId, PaymentStatus.PENDING).value.sum()
        BigDecimal overdue = overduePaymentList.value.sum()

        return [totalPayers: totalPayers, defaulters: defaulters, nonDefaulters: nonDefaulters, received: received, foreseen: foreseen, overdue: overdue]
    }
}
