package com.desafio.domain

abstract class BaseController {

    static mapping = {
        tablePerHierachy false
    }
    
    public Integer getCurrentPage() {
        if (!params.offset) params.offset = 0
        return Integer.valueOf(params.offset)
    }
}   