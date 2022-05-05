package com.desafio.domain
import com.desafio.domain.payer.Payer

class PayerService {
    def save(Map params) {
        Payer payer = new Payer()
        payer.name = params.name
        payer.cpfCnpj = params.cpfCnpj
        payer.address = params.address
        payer.district = params.district
        payer.city = params.city
        payer.state = params.state
        payer.number = params.int("number")
        payer.cep = params.int("cep")
        payer.email = params.email
        payer.phone = params.phone
        payer.save(failOnError: true)
    }

}