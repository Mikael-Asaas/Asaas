package com.desafio.domain.payer

class Payer {

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
        name size: 3..100, nulllable: true
        email size: 5..50, blank: false
    }
}