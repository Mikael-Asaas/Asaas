package com.desafio.domain

import com.desafio.domain.customer.Customer
import grails.gorm.transactions.Transactional

@Transactional
class CustomerService {

    public Customer save(Map params) { 
        Customer customer = new Customer(params)
        customer.save(failOnError: true)
        return customer
    }

    public Customer getCustomer(Long id){
        return Customer.get(id) 
    }

    public Customer update(Long id, Map params) {
        if (!id) { 
            throw new Exception( "Erro ao editar!")
            return
        }
        Customer customer = Customer.get(params.long("id"))
        customer.name = params.name
        customer.cpfCnpj = params.cpfCnpj
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
}