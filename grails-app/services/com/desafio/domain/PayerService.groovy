package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {
    public Payer save(Map params) {
        Payer payer = new Payer(params)
        payer.save(failOnError: true)
    }

    def getPayer(Integer id) {
        return Payer.get(id)
    }

    def update(Map params) {
        if (params.id) {
            Payer payer = Payer.get(params.int('id'))
            payer.name = params.name
            payer.cpfCnpj = params.cpfCnpj
            payer.address = params.address
            payer.province = params.province
            payer.city = params.city
            payer.state = params.state
            payer.addressNumber = params.addressNumber
            payer.postalCode = params.postalCode
            payer.email = params.email
            payer.phone = params.phone
            payer.save(failOnError: true)
       } else {
            throw new Exception('Erro ao realizar edição')
        }
    }

}
