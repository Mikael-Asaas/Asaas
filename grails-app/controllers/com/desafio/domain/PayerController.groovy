package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class PayerController extends BaseController {

    def springSecurityService
    def payerService

    def create() {
        return [customerId: params.long("customerId")]
    }

    def index() {
        Customer customer = springSecurityService.getCurrentUser().customer 
        PagedResultList payerList =  Payer.createCriteria().list(max: getLimitPage(), offset: getCurrentPage()) {
            eq("customer", customer) 
        }
        return [payerList: payerList, totalCount: payerList.totalCount]
    }

    def save() {
        try {
            Payer payer = payerService.save(params) 
            if (payer.hasErrors()) {
                render([success: false, message: message(code: payer.errors.allErrors[0].defaultMessage ?: payer.errors.allErrors[0].codes[0])] as JSON)
                return
            }
            render([success: true] as JSON)
        } catch (Exception exception) {
            render([success: false, message: message(code: 'unknow.error')] as JSON)
        }
    }

    def update() {
        try {
            Long payerId = params.long("payerId")
            payerService.update(payerId, params)
            render([success: true] as JSON)
        } catch (Exception exception) {
            render([success: false, message: message(code:'unknow.error')] as JSON)
        }
    }

    def show() {
        return [payer: Payer.get(params.long('payerId'))]
    }
}
