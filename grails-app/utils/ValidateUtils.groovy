package com.desafio.utils

import com.desafio.enums.PaymentMethod
import com.desafio.utils.DateUtils

import groovy.json.JsonSlurper
import java.lang.String
import java.math.BigDecimal
import java.net.URL.*
import org.apache.commons.validator.routines.EmailValidator

class ValidateUtils {
    
    public static String digitsOnlyCleaner(String dirty) {
        String clean = dirty.replaceAll("[^0-9]", '')
        return clean
    }

    public static Boolean validateNotNull(String parameter) {
        if (parameter != null) {
            return true
        }
        return false
    }

    public static Boolean validatePostalCode(String postalCode) {
        String cleanPostalCode = digitsOnlyCleaner(postalCode)
        if (cleanPostalCode != null && cleanPostalCode.length() == 8) {
            def get = new URL("https://viacep.com.br/ws/" + cleanPostalCode + "/json/").openConnection()
            def sluper = new JsonSlurper()
            def getResponse = sluper.parseText(get.content.text)
            if (getResponse.erro) { 
                return false
            }
            return true
        }
        return false
    }


}   
