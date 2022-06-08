package com.desafio.utils

    class DomainUtils {

        public static Object addError(Object entity, String message) {
        entity.errors.reject("", null, "Um problema inesperado ocorreu. Aguarde alguns minutos e tente novamente. Caso o problema persista, entre em contato com os administradores do sistema.")
        return entity
    }
}
