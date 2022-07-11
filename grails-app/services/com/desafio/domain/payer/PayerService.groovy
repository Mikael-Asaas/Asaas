package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.gorm.transactions.Transactional
import com.desafio.domain.customer.Customer

@Transactional
class PayerService {

    public Payer save(Map params) {
        Customer customer = springSecurityService.getCurrentUser().customer 
        Payer payer = new Payer(params)
        payer.customer = customer
        payer.save(failOnError: true)
        return payer
    }
    
    public Payer update(Long payerId, Map params) {
        if (!payerId) throw new Exception("Erro ao realizar atualização de informação")
        Payer payer = Payer.get(params.long("payerId"))
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
