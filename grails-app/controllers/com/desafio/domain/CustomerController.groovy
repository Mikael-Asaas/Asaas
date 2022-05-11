package com.desafio.domain

import com.desafio.domain.customer.Customer
import grails.converters.JSON
import grails.gorm.PagedResultList

class CustomerController {

   def customerService
   
   def create () {}

   def index() {
        PagedResultList customerList = Customer.list(max: 10, offset: getCurrentPage())
        return [customerList: customerList , totalCount: customerList.totalCount]
    }
  
   private Integer getCurrentPage() {
      if(!params.offset) params.offset = 0
      return Integer.valueOf(params.offset)
    }
  
   public save (){
      try { 
         Customer customer = customerService.save(params)
      if (customer.hasErrors()) {
          render([success: false, message: message(code: customer.errors.allErrors[0].defaultMessage ?: customer.errors.allErrors[0].codes[0])] as JSON)
      return 
       }     
          render([success: true] as JSON)
     }catch(Exception e) {
            render([success: false, message: message(code: 'unknow.error')] as JSON)
      } 
   }
  
   def update (){
      try {
            Long id = params.long('id')
            customerService.update(id, params)
            render([success: true] as JSON)
      } catch(Exception e) {
            render([success: false, message: "Erro ao tentar atualizar"] as JSON)
      } 
   }
  
   def show (){
      return [customer: customerService.getCustomer(params.long("id"))]
   }
}
