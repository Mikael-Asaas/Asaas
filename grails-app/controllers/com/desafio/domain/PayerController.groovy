package com.desafio.domain

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import com.desafio.domain.payer.Payer

class PayerController {

    def payerService

    // static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(){
    
    }

    def save(){
        // println(params)
        // render("ok")
        payerService.save(params)
        render("ok")       
    }

    def list(){
        // respond payerService.list(params), model:[customerCount: payerService.count()]
        return [payerList: payerService.list()]
    }
}
