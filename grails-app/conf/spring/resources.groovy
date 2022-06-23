import com.desafio.UserPasswordEncoderListener
import com.desafio.domain.CustomUserDetailsService

beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    userDetailsService(CustomUserDetailsService)
}