package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.customer.Customer
import grails.converters.JSON
import grails.gorm.PagedResultList

class CustomerController extends BaseController {

   def customerService
   
   def create() { }

   def index() {
        PagedResultList customerList = Customer.list(max: 10, offset: getCurrentPage())
            return [customerList: customerList , totalCount: customerList.totalCount]
    }
  
   def save(){
      try { 
         Customer customer = customerService.save(params)
         if (customer.hasErrors()) {
            render([success: false, message: message(code: customer.errors.allErrors[0].defaultMessage ?: customer.errors.allErrors[0].codes[0])] as JSON)
            return 
       }     
            render([success: true] as JSON)
     }catch(Exception exception) {
            render([success: false, message: message(code: 'unknow.error')] as JSON)
      } 
   }
  
   def update(){
      try {
            Long id = params.long('id')
            customerService.update(id, params)
            render([success: true] as JSON)
      } catch(Exception exception) {
            render([success: false, message: "Erro ao tentar atualizar"] as JSON)
      } 
   }
  
   def show(){
         return [customer: Customer.get(params.long("id"))]
   }
}
