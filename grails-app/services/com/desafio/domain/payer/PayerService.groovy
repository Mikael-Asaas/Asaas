package com.desafio.domain

import com.desafio.domain.payer.Payer
import com.desafio.domain.customer.Customer
import com.desafio.utils.DomainUtils
import com.desafio.utils.ValidateUtils
import grails.gorm.transactions.Transactional

@Transactional
class PayerService {

    public Payer save(Map params) {
        Customer customer = Customer.get(params.long("customerId"))
        Payer payer = new Payer()
        payer = validate(payer, params)
        if (payer.hasErrors()) return payer
        payer.customer = customer
        payer.name = params.name
        payer.cpfCnpj = params.cpfCnpj
        payer.address = params.address
        payer.addressNumber = params.addressNumber
        payer.province = params.province
        payer.city = params.city
        payer.state = params.state
        payer.postalCode = params.postalCode
        payer.email = params.email
        payer.phone = params.phone
        payer.save(failOnError: true)
        return payer
    }
    
    public Payer update(Long id, Map params) {
        if (!id) throw new Exception("Erro ao realizar atualização de informação")
        Payer payer = Payer.get(params.long("id"))
        payer = validate(payer, params)
        if (payer.hasErrors()) return payer
        payer.name = params.name
        payer.cpfCnpj = params.cpfCnpj
        payer.address = params.address
        payer.addressNumber = params.addressNumber
        payer.province = params.province
        payer.city = params.city
        payer.state = params.state
        payer.postalCode = params.postalCode
        payer.email = params.email
        payer.phone = params.phone
        payer.save(failOnError: true)
        return payer
    }

    public Payer validate(Payer payer, Map params) {
        if (!ValidateUtils.emailIsValid(params.email)) {
            DomainUtils.addError(payer, "E-mail inválido")
        }
        if (!ValidateUtils.validateCpfCnpj(params.cpfCnpj)) {
            DomainUtils.addError(payer, "CPF/CNPJ inválido")
        }
        if (!ValidateUtils.validatePostalCode(params.postalCode)) {
            DomainUtils.addError(payer, "CEP inválido")
        }
        if (!ValidateUtils.isNotNull(params.name)) {
            DomainUtils.addError(payer, "Nome é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.address)) {
            DomainUtils.addError(payer, "Endereço é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.province)) {
            DomainUtils.addError(payer, "Bairro é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.city)) {
            DomainUtils.addError(payer, "Cidade é obrigatório")
        }
        if (!ValidateUtils.isNotNull(params.state)) {
            DomainUtils.addError(payer, "Estado é obrigatório")
        }
        return payer
    }
}
