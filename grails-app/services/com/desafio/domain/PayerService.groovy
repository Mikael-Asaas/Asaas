package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {
    public Payer save(Map params) {
        Payer payer = new Payer(params)
        payer.save(failOnError: true)
    }
}