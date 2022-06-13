package com.desafio.domain

import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import com.desafio.domain.User
import com.desafio.domain.Role
import com.desafio.domain.UserRole
import com.desafio.domain.customer.Customer
import com.desafio.domain.CustomUserDetails

@Transactional
@Secured('permitAll')
class RegisterController {

    static allowedMethods = [register: "POST"]

    def index() { }

    def register() {
        if(!params.password.equals(params.repassword)) {
            flash.message = "Senha diferente"
            redirect action: "index"
            return
        } else {
            try {
                def user = User.findByUsername(params.username)?: new User(username: params.username, password: params.password).save()
                def role = Role.get(2)
                if(user && role) {
                    UserRole.create user, role

                    UserRole.withSession {
                      it.flush()
                      it.clear()
                    }

                    flash.message = "Você se registrou com sucesso. Por favor faça seu login."
                    redirect controller: "login", action: "auth"
                } else {
                    flash.message = "Falha ao registar"
                    render view: "index"
                    return
                }
            } catch (ValidationException e) {
                flash.message = "Falha ao registar"
                redirect action: "index"
                return
            }
        }
    }
}