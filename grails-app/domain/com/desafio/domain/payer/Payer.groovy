package com.desafio.domain.payer

import com.desafio.domain.customer.Customer

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

    Customer customer

    static constraints = {
        name blank: false
        email email: true, blank: false, unique: true
        cpfCnpj blank: false
        postalCode blank: false
        address blank: false
        province blank: false
        city blank: false
        state blank: false
    }
}
