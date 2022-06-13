package desafio

import com.desafio.utils.DateUtils
import com.desafio.domain.payment.Payment
import com.desafio.domain.PaymentService
import com.desafio.enums.PaymentStatus

class OverDueJob {
   
    def paymentService
  
    static triggers = {
      cron name: "OverDueJob", cronExpression: "0 0/1 * 1/1 * ? *"
    }

    static concurrent = false

    def execute() {
       try {
            paymentService.verifyOverDueDates()
        } catch (Exception exception) {
            log.error "Ocorreu um erro"
        }
    }
}
