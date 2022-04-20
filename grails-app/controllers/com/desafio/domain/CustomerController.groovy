package com.desafio.domain

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CustomerController {

   def customerService

   def create() { }

   def list() {
       return [customerList: customerService.list()]
    }
   def save (){
        try{
           
        }
        catch 
       }
    }
