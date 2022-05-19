package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {

    public Payer save(Map params) {
        validate(params)
        Payer payer = new Payer(params)
        payer.save(failOnError: true)
        return payer
    }
    
    public Payer update(Long id, Map params) {
        if (!id) throw new Exception("Erro ao realizar atualização de informação")
        validate(params)
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

    private void validate(Map params) {
        if(!params.name){
            throw new Exception("Nome não informado.")
        }
        if(!params.email){
            throw new Exception("Email não informado.")
        }
        if(!params.cpfCnpj){
            throw new Exception("CPF/CNPJ não informado.")
        }
        if(!params.postalCode){
            throw new Exception("CEP não informado.")
        }
        if(!params.address){
            throw new Exception("Endereço não informado.")
        }
        if(!params.addressNumber){
            throw new Exception("Numero não informado.")
        }
        if(!params.province){
            throw new Exception("Bairro não informado.")
        }
        if(!params.city){
            throw new Exception("Cidade não informado.")
        }
        if(!params.state){
            throw new Exception("Estado não informado.")
        }
    }
}
