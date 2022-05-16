package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {

    public Payer save(Map params) {
        Payer payer = new Payer(params)
        payer.save(failOnError: true)
        return payer
    }
    
    public Payer update(Long id, Map params) {
        if (!id) {
            throw new Exception('Erro ao realizar edição');
            return 
        }
        Payer payer = Payer.get(id)
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
        return payer
    }
}
