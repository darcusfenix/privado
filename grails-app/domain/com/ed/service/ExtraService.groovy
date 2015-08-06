/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of extra service
 */

package com.ed.service

class ExtraService extends Service{

    Float fullIncome
    String description
    static hasMany = [extraIncome: ExtraIncome]
    static mappedBy = [extraIncome: 'extraService']

    static constraints = {
    }

    static mapping = {
        table 't_extra_service_tab'
        version false
        fullIncome column: 'nu_full_income'
    }
}
