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
        name nullable: true 
        phone nullable: true
        email email: true
        cpfCnpj nullable: true 
        postalCode nullable: true 
        address nullable: true 
        addressNumber nullable: true
        province nullable: true 
        city nullable: true 
        state nullable: true 
    }

}
