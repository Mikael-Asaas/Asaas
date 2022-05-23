package com.desafio.utils

import java.text.SimpleDateFormat

class DateUtils{

    public static Date formatStringToDate(String date, String pattern) {
        SimpleDateFormat formatDate = new SimpleDateFormat(pattern)
        return formatDate.parse(date)
    }
}