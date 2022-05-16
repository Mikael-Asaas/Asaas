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
        name size: 3..100, blank: false
        cpfCnpj blank: false
        postalCode size: 8..9, blank: false
        address size: 2..100, blank: false
        province size: 2..100, blank: false
        city size: 2..50, blank: false
        state size: 1..50, blank: false
    }

}
