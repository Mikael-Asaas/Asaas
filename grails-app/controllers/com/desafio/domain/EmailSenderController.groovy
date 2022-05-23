package com.desafio.domain

class EmailSenderController {

    def index() {}

def send() {
    sendMail{
        to params.sendEmail
        subject params.sendSubject
        text params.sendMessage
    }

    flash.message = "Message sent at "+new Date()
    redirect action:"index"
}
}