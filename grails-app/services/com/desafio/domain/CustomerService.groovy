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
    private void validate (Map params){ 
        if (!params.id){
                throw new Exception("Erro ao registrar.")
        }
         if (!params.name){
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