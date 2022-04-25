package com.desafio.domain
import com.desafio.domain.payer.Payer

class PayerService {
    def save(Map params){
        Payer payer = new Payer()
        payer.name = params.name
        payer.cpf = params.cpf
        payer.address = params.address
        payer.district = params.district
        payer.city = params.city
        payer.state = params.state
        payer.number = params.int("number")
        payer.cep = params.int("cep")
        payer.email = params.email
        payer.telephone = params.telephone
        payer.save(failOnError: true)
    }

}