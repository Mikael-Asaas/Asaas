package com.desafio.base

abstract class BaseEntity {

    Date dateCreated = new Date()

    Date lastUpdate = dateCreated

    Date dateDeleted

    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {
        dateDeleted nullable: true
    }
}