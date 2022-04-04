package com.desafio.domain

class Customer {

    String nome
    String cpf
    String endereco
    String bairro
    String cidade
    String estado
    Integer cep
    String email 
    String telefone


    static constraints = {
        nome size: 5..50, blank: false
        email size: 5..50, blank: false
    }
}
