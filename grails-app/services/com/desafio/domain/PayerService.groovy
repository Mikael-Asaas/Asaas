package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {

    def save(Map params) {
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
            payer.cpf = params.cpf
            payer.address = params.address
            payer.district = params.district
            payer.city = params.city
            payer.state = params.state
            payer.number = params.number
            payer.cep = params.cep
            payer.email = params.email
            payer.telephone = params.telephone
            payer.save(flush: true, failOnError: true)
       } else {
            throw new Exception('Erro ao realizar edição')
        }
    }
}
