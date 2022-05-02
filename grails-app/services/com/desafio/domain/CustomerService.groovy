import com.desafio.domain.customer.Customer
import grails.gorm.transactions.Transactional

@Transactional
class CustomerService {

    def save (Map params) {   
        Customer customer = new Customer(params)
        customer.save(failOnError: true)
    }
    
    def list () {
        return Customer.getAll ()
    }
   
    def getCustomer(Integer id){
        return Customer.get(id) 
        }
  
    def update (Map params) {
        if (params.id){
            Customer customer = Customer.get(params.int("id"))
            customer.name = params.name
            customer.cpf= params.cpf
            customer.address = params.address
            customer.district = params.district
            customer.city = params.city
            customer.state = params.state
            customer.number = params.number
            customer.cep = params.cep
            customer.email = params.email
            customer.telephone = params.telephone
            customer.save(flush: true, failOnError: true)
        }else {
        throw new Exception( "Erro ao editar!")
    }
  }
}