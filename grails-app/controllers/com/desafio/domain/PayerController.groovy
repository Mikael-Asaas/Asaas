package com.desafio.domain

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import com.desafio.domain.payer.Payer

class PayerController {

    def payerService

    def create(){}

    def save(){
        payerService.save(params)
        render("Pagador salvo")
    }
    
    def list(){
        return [payerList: payerService.list()]
    }
}