package desafio

import com.desafio.domain.Role
import com.desafio.domain.User
import com.desafio.domain.UserRole

class BootStrap {

    def init = { servletContext -> 
        new Role(authority:"ROLE_ADMIN").save()
        new Role(authority:"ROLE_USER").save()
    }
    def destroy = {
    }
}
