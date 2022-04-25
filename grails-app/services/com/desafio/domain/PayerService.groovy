package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {

    def save(Map params) {
        Payer payer = new Payer(params)
        payer.save(failOnError: true)
    }

    def list() {
        return Payer.getAll()
    }

    def getPayer(Integer id) {
        return Payer.get(id)
    }

    def update(Map params) {
        if (params.id) {
            Payer payer = Payer.get(params.int('id'))
            payer.nome = params.nome
            payer.cpf = params.cpf
            payer.endereco = params.endereco
            payer.bairro = params.bairro
            payer.cidade = params.cidade
            payer.estado = params.estado
            payer.numero = params.numero
            payer.cep = params.cep
            payer.email = params.email
            payer.telefone = params.telefone
            payer.save(flush: true, failOnError: true)
       } else {
            throw new Exception('Erro ao realizar edição')
        }
    }

}
