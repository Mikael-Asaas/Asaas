package com.desafio.domain.payer
import com.desafio.domain.customer.Customer

class Payer {

    String name
    String cpf
    String address
    String district
    String city
    String state
    String number
    String cep
    String email
    String telephone
    Customer customer

    static constraints = {
        name size: 3..100, nulllable: true
        email size: 5..50, blank: false
    }

}
