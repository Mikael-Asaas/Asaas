package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.customer.Customer

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.plugin.springsecurity.annotation.Secured

class CustomerController extends BaseController {

   def customerService
   
   @Secured(['ROLE_ADMIN', 'ROLE_USER'])
   def create() { }

   @Secured(['ROLE_ADMIN', 'ROLE_USER'])
   def index() {
      PagedResultList customerList = Customer.list(max: getLimitPage(), offset: getCurrentPage())
      return [customerList: customerList , totalCount: customerList.totalCount]
    }
  
   @Secured(['ROLE_ADMIN', 'ROLE_USER'])
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

   @Secured(['ROLE_ADMIN', 'ROLE_USER'])
   def update(){
      try {
         Long id = params.long('id')
         customerService.update(id, params)
         render([success: true] as JSON)
      } catch(Exception exception) {
         render([success: false, message: "Erro ao tentar atualizar"] as JSON)
      } 
   }

   @Secured(['ROLE_ADMIN', 'ROLE_USER'])
   def show(){
      return [customer: Customer.get(params.long("id"))]
   }
}