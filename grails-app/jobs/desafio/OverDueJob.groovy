package desafio

class OverDueJob {
   
    def paymentService
  
    static triggers = {
      cron name: "OverDueJob", cronExpression: "0 0/1 * 1/1 * ? *"
    }

    static concurrent = false

    def execute() {
       try {
            paymentService.updateToOverdue()
        } catch (Exception exception) {
            log.error "Ocorreu um erro ao marcar as cobranças como vencidas"
        }
    }
}
