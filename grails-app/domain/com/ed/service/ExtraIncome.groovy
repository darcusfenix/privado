/**
 * By: Tapia Mujica Fernando 6/07/15
 * Desc: Entity to abstract the logic of extra income service
 */

package com.ed.service

class ExtraIncome implements Serializable{

    Date incomeDate
    Float income
    Office office

    static belongsTo = [extraService: ExtraService]

    static constraints = {
    }

    static mapping = {
        table 't_extra_income_tab'
        id column: 'id_income', generator: 'identity'
        incomeDate column: 'fh_income'
        income column: 'nu_income'
        version false
    }
}
