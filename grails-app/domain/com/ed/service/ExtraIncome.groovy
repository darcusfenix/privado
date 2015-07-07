/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of extra income service
 */

package com.ed.service

class ExtraIncome implements Serializable{

    Integer incomeId
    Date incomeDate
    Float income
    static belongsTo = [extraService: ExtraService]

    static constraints = {
    }

    static mapping = {
        table 't_extra_income_tab'
        id name: 'incomeId', column: 'id_income', generator: 'identity'
        incomeDate column: 'fh_income'
        income column: 'nu_income'
        version false
    }
}
