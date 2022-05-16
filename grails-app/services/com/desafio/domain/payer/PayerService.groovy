package com.desafio.domain

import com.desafio.domain.payer.Payer
import grails.gorm.transactions.Transactional
import com.desafio.domain.customer.Customer

@Transactional
class PayerService {

    public Payer save(Map params) {
        Customer customer = Customer.get(params.long("customerId"))
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
            throw new Exception("Erro no reigstro do nome.")
        }
        if(!params.email){
            throw new Exception("Erro no reigstro do email.")
        }
        if(!params.cpfCnpj){
            throw new Exception("Erro no reigstro do CPF/CNPJ.")
        }
        if(!params.postalCode){
            throw new Exception("Erro no reigstro do CEP.")
        }
        if(!params.address){
            throw new Exception("Erro no reigstro do Endereço.")
        }
        if(!params.addressNumber){
            throw new Exception("Erro no reigstro do Numero.")
        }
        if(!params.province){
            throw new Exception("Erro no reigstro do Bairro.")
        }
        if(!params.city){
            throw new Exception("Erro no reigstro do Cidade.")
        }
        if(!params.state){
            throw new Exception("Erro no reigstro do Estado.")
        }
    }
}
