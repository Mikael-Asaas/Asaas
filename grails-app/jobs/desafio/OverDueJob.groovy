package com.jobs.desafio

import com.desafio.domain.PaymentService

class OverDueJob {
   
    def paymentService
  
    static triggers = {
      cron name: "OverDueJobTrigger", cronExpression: "0 0/1 * 1/1 * ? *"
    }

    static concurrent = false

    def execute() {
        try {
            paymentService.updateToOverdue()
        }catch (Exception exception){ 
            log.error "OverDueJob.execute : Ocorreu um erro ao marcar as cobranças como vencidas"
        } 
    }
}
