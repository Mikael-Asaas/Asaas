package com.desafio.domain

import grails.plugin.asyncmail.AsynchronousMailService

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
