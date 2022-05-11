package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.converters.JSON
import grails.gorm.PagedResultList

class PayerController {

    def payerService

    def create() { }

    def index() {
        PagedResultList payerList = Payer.list(max: 10, offset: getCurrentPage())
        return [payerList: payerList , totalCount: payerList.totalCount]
    }
    
    private Integer getCurrentPage() {
        if(!params.offset) params.offset = 0
        return Integer.valueOf(params.offset)
    }

    def save() {
        try {
            Payer payer = payerService.save(params)

            if(payer.hasErrors()) {
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
            Long id = params.long("id")
            payerService.update(id, params)
            render([success: true] as JSON)
        } catch (Exception exception) {
            render([success: false, message: message(code:'unknow.error')] as JSON)
        }
    }

    def show() {
        return [payer: payerService.getPayer(params.long('id'))]
    }

}
