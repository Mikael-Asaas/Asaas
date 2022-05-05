package com.desafio.domain.payer


class Payer {

    String name
    String cpf
    String address
    String district
    String city
    String state
    Integer number
    Integer cep
    String email
    String phone


    static constraints = {
        name size: 3..100, nulllable: true
        email size: 5..50, blank: false
    }
}