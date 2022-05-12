package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.payer.Payer
import grails.converters.JSON
import grails.gorm.PagedResultList

class PayerController extends BaseController {

    def payerService

    def create() { }

    def index() {
        PagedResultList payerList = Payer.list(max: 10, offset: getCurrentPage())
        return [payerList: payerList , totalCount: payerList.totalCount]
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
            Long id = params.long("id")
            payerService.update(id, params)
            render([success: true] as JSON)
        } catch (Exception exception) {
            render([success: false, message: message(code:'unknow.error')] as JSON)
        }
    }

    def show() {
        return [payer: Payer.get(params.long('id'))]
    }
}
