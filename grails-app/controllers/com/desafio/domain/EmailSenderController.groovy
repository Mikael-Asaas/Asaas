package com.desafio.domain

class EmailSenderController {

    def index() {}

    def send() {
    sendMail{
        to params.address
        subject params.subject
        text params.body
    }

    flash.message = "Message sent at "+new Date()
    redirect action:"index"
}
}