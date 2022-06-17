package com.desafio.domain

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_USER'])
class DashboardController{

    def dashboardService
    def springSecurityService

    def create() { }

    def index() {
        Long customerId = params.long("id")
        println "customerId ${customerId}"
        Map dashboard = dashboardService.getDashboardInfo(customerId)
        return [dashboard: dashboard]
    }
  
    def save(){}
  
    def update(){}
  
    def show(){}
}