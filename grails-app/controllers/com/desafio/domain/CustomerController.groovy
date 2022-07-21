package com.desafio.domain

import com.desafio.base.BaseController
import com.desafio.domain.customer.Customer

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class CustomerController extends BaseController {

   def customerService
   def springSecurityService

   def create() { }

   def index() {
         redirect action: "show"
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