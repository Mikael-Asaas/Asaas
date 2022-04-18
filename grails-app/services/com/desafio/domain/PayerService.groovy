package com.desafio.domain
import com.desafio.domain.payer.Payer

class PayerService {
    def save(Map params){
        println(params)
        Payer payer = new Payer()
        payer.nome = params.nome
        payer.cpf = params.cpf
        payer.endereco = params.endereco
        payer.bairro = params.bairro
        payer.cidade = params.localidade
        payer.estado = params.uf
        payer.numero = params.int("numero")
        payer.cep = params.int("cep")
        payer.email = params.email
        payer.telefone = params.telefone
        payer.save(failOnError: true)
    }

}