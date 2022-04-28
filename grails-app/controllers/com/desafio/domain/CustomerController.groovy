package com.desafio.domain

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import com.desafio.domain.customer.Customer
import grails.converters.JSON

class CustomerController {

   def customerService
  
   
   def create () {}

   def index () {
     return [customerList: Customer.list(max: 10, offset: getCurrentPage()), totalCount: Customer.count()]
   }
   
   private Integer getCurrentPage() {
      if(!params.offset) params.offset = 0
      return Integer.valueOf(params.offset)
    }
  
   def save () {
      try {
            customerService.save(params)
            render([success: true] as JSON)
      } catch(Exception e) {
            render([success: false, message: "Erro ao tentar salvar"] as JSON)
      } 
   }
  
   def update (){
      try {
            customerService.update(params)
            render([success: true] as JSON)
      } catch(Exception e) {
            render([success: false, message: "Erro ao tentar atualizar"] as JSON)
      } 
   }
  
   def show (){
      return [customer: customerService.getCustomer(params.int("id"))]
   }
}
