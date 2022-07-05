package com.desafio.domain

import grails.plugin.asyncmail.AsynchronousMailService
import grails.gorm.transactions.Transactional 

@Transactional
class EmailService {

    AsynchronousMailService asynchronousMailService
    
    def sendEmail(String email, String mailSubject, String mailBody) {
        asynchronousMailService.sendMail {
            to email
            subject mailSubject
            html mailBody
        }
    }
}
