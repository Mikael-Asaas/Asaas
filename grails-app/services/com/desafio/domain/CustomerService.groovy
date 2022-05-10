package com.desafio.domain

import com.desafio.domain.customer.Customer
import grails.gorm.transactions.Transactional

@Transactional
class CustomerService {

    def save (Map params) {   
        Customer customer = new Customer(params)
        customer.save(failOnError: true)
    }
    
    def getCustomer(Integer id){
        return Customer.get(id) 
        }

    def update (Map params, Long id) {
        if (params.id){ 
            Customer customer = Customer.get(params.int("id"))
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
        }else {
        throw new Exception( "Erro ao editar!")
    }
  }
}