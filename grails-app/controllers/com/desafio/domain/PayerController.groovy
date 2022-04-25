package com.desafio.domain

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import com.desafio.domain.payer.Payer
import grails.converters.JSON

class PayerController {

    def payerService

    def create() { }

    def index() {
        return [payerList: Payer.getAll()]
    }

    def save() {
        try {
            payerService.save(params)
            render([success: true] as JSON)
        } catch (Exception e) {
            render([success: false, message: 'Erro ao tentar salvar'] as JSON)
        }
    }

    def update() {
        try {
            payerService.update(params)
            render([success: true] as JSON)
        } catch (Exception e) {
            render([success: false, message: 'Erro ao tentar atualizar'] as JSON)
        }
    }

    def show() {
        return [payer: payerService.getPayer(params.int('id'))]
    }

}
