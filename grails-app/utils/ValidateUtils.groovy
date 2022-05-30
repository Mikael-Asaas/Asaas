package com.desafio.utils

import com.desafio.domain.customer.Customer
import com.desafio.domain.payer.Payer

class ValidateUtils {
    
    public static String removeNonNumeric(String postalCode) {
    if (postalCode == null) return null

    return postalCode?.replaceAll("\\D+","")
    }

}