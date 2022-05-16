package com.desafio.base

abstract class BaseController {

    private Integer getLimitPage() {
        return 10
    }
    
    private Integer getCurrentPage() {
        if (!params.offset) params.offset = 0
        return Integer.valueOf(params.offset)
    }
}   