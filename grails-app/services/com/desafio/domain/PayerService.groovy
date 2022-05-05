package com.desafio.domain

import com.desafio.domain.payer.Payer

class PayerService {
    def save(Map params) {
        Payer payer = new Payer()
        payer.name = params.name
        payer.cpfCnpj = params.cpfCnpj
        payer.address = params.address
        payer.province = params.province
        payer.city = params.city
        payer.state = params.state
        payer.addressNumber = params.int("addressNumber")
        payer.postalCode = params.int("postalCode")
        payer.email = params.email
        payer.phone = params.phone
        payer.save(failOnError: true)
    }

}