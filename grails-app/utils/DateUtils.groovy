package com.desafio.utils

import java.text.SimpleDateFormat

class DateUtils {

    public static Date formatStringToDate(String dueDate, String pattern) {
        SimpleDateFormat formatDate = new SimpleDateFormat(pattern)
        return formatDate.parse(dueDate)
    }

    public static Date getYesterday() {
        return new Date().clearTime().previous()
    }
}
