package com.desafio.domain

import com.desafio.domain.customer.Customer
import com.desafio.utils.DomainUtils
import com.desafio.utils.ValidateUtils
import grails.gorm.transactions.Transactional

@Transactional
class CustomerService {

    public Customer save(Map params) { 
        Customer customer = new Customer()
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
        customer.save(failOnError: true)
        return customer
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
        customer.save(failOnError: true)
        return customer
    }

    public Customer validate(Customer customer, Map params) {
        if (!ValidateUtils.emailIsValid(params.email)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.validateCpfCnpj(params.cpfCnpj)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.validatePostalCode(params.postalCode)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.name)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.address)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.province)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.city)) {
            DomainUtils.addError(customer, "")
        }
        if (!ValidateUtils.isNotNull(params.state)) {
            DomainUtils.addError(customer, "")
        }
        return customer
    }
}
