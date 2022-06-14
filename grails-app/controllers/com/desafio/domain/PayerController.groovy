package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer

import grails.converters.JSON
import grails.gorm.PagedResultList

class PayerController extends BaseController {

    def payerService

    def create() {
        return [customerId: params.long("customerId")]
    }

    def index() {
        Long customerId = Long.valueOf(params.customerId)
        PagedResultList payerList =  Payer.createCriteria().list(max: getLimitPage(), offset: getCurrentPage()) {
            eq("customer.id", customerId) 
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
