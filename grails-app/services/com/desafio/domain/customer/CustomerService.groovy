package com.desafio.domain

import com.desafio.domain.customer.Customer
import com.desafio.utils.DomainUtils
import com.desafio.utils.ValidateUtils
import grails.gorm.transactions.Transactional

@Transactional
class CustomerService {

    public Customer save(Map params) { 
        Customer customer = new Customer()
        Customer validatedCustomer = validate(customer, params)
            if (validatedCustomer.hasErrors()) return validatedCustomer

            customer.name = params.name
            customer.cpfCnpj= params.cpfCnpj
            customer.address = params.address
            customer.addressNumber = params.addressNumber
            customer.province = params.province
            customer.city = params.city
            customer.state = params.state
            customer.postalCode = params.postalCode
            customer.email = params.email
            customer.phone = params.phone

            return customer.save(failOnError: true)
    }

    public Customer getCustomer(Long id) {
        return Customer.get(id) 
    }

    public Customer update(Long id, Map params) {
        Customer customer = Customer.get(params.long("id"))
        customer = validate(customer, params)
        if (customer.hasErrors()) return customer

        customer.name = params.name
        customer.cpfCnpj= params.cpfCnpj
        customer.address = params.address
        customer.addressNumber = params.addressNumber
        customer.province = params.province
        customer.city = params.city
        customer.state = params.state
        customer.postalCode = params.postalCode
        customer.email = params.email
        customer.phone = params.phone
        
        return customer.save(failOnError: true)
    }

    public Customer validate(Customer customer, Map params) {
        if (!ValidateUtils.emailIsValid(params.email)) {
            DomainUtils.addError(customer, "E-mail inválido")
        }
        
        if (!ValidateUtils.validateCpfCnpj(params.cpfCnpj)) {
            DomainUtils.addError(customer, "CPF/CNPJ inválido")
        }

        if (!ValidateUtils.validatePostalCode(params.postalCode)) {
            DomainUtils.addError(customer, "CEP inválido")
        }

        if (!ValidateUtils.isNotNull(params.name)) {
            DomainUtils.addError(customer, "Nome é obrigatório")
        }

        if (!ValidateUtils.isNotNull(params.address)) {
            DomainUtils.addError(customer, "Endereço é obrigatório")
        }
        
        if (!ValidateUtils.isNotNull(params.province)) {
            DomainUtils.addError(customer, "Bairro é obrigatório")
        }

        if (!ValidateUtils.isNotNull(params.city)) {
            DomainUtils.addError(customer, "Cidade é obrigatório")
        }

        if (!ValidateUtils.isNotNull(params.state)) {
            DomainUtils.addError(customer, "Estado é obrigatório")
        }

        return customer
    }
}
