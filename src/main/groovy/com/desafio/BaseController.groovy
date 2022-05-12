package com.desafio.base

abstract class BaseController {

    static mapping = {
        tablePerHierachy false
    }
    
    private Integer getCurrentPage() {
        if(!params.offset) params.offset = 0
        return Integer.valueOf(params.offset)
    }

}   