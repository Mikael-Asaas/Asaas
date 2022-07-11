package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.customer.Customer
import com.desafio.domain.User

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class CustomerController extends BaseController {

   def customerService
   def springSecurityService

   def create() { }

   def index() {
      Customer customer = springSecurityService.getCurrentUser().customer  
         redirect action: "show"
   }
   def save(){
      try { 
         Customer customer = springSecurityService.getCurrentUser().customer 
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
         Customer customer = springSecurityService.getCurrentUser().customer  
         customerService.update(customer, params)
         redirect action: "show"
   }

   def show(){
      return [customer: springSecurityService.currentUser.customer]
   }
}