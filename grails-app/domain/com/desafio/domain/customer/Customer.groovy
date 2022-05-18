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
        name blank: false
        cpfCnpj blank: false
        postalCode blank: false
        address blank: false
        province blank: false
        city blank: false
        state blank: false
    }

}
