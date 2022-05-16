package com.desafio.domain.customer

class Customer {
    
    String name

    String cpfCnpj

    String address

    String addressNumber

    String province

    String city

    String state

    String postalCode

    String email
    
    String phone

    static constraints = {
        name size: 3..100, nulllable: false, blank: false
        cpfCnpj nulllable: false, blank: false
        postalCode size: 8..9, nulllable: false, blank: false
        address size: 2..100, nulllable: false, blank: false
        province size: 2..100, nulllable: false, blank: false
        city size: 2..50, nulllable: false, blank: false
        state size: 1..50, nulllable: false, blank: false
    }
}