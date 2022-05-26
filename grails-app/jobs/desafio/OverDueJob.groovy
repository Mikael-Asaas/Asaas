package desafio

import com.desafio.utils.DateUtils
import com.desafio.domain.payment.Payment
import com.desafio.domain.PaymentService
import com.desafio.enums.PaymentStatus

import grails.gorm.transactions.Transactional

@Transactional
class OverDueJob {
   
    def paymentService
  
    static triggers = {
      cron name: "OverDueJob", cronExpression: "0 0/1 * 1/1 * ? *"
    }

    static concurrent = false

    def execute() {
        Date yesterdayDate = DateUtils.getYesterdayDate()
        List<Payment> paymentList = paymentService.returnPaymentStatusAndDate(PaymentStatus.PENDING, yesterdayDate)
        for(Payment payment : paymentList) {
            payment.status = PaymentStatus.OVERDUE
            payment.save(failOnError:true)
        }      
    }
}
