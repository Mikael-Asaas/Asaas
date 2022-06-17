package com.desafio.domain

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

import com.desafio.domain.User
import com.desafio.domain.Role
import com.desafio.domain.UserRole
import com.desafio.domain.customer.Customer
import com.desafio.domain.CustomUserDetails

@Transactional
@Secured('permitAll')
class RegisterController {

    def registerService

    static allowedMethods = [register: "POST"]

    def index() {}

    def register() {
        if (!params.password.equals(params.repassword)) {
            flash.message = "Senhas não combinam"
            redirect action: "index"
            return
        } else {
            registerService.register(params)
            redirect controller: "login", action: "auth"
        }
    }
}