package com.desafio.domain

import com.desafio.domain.payer.Payer

class PayerController {

    def payerService

    def create() { }

    def save() {
        payerService.save(params)
        render("Pagador salvo")
    }
}