package com.ed.reports

import com.ed.accesscontrol.StudentService
import com.ed.classroomcourse.Classroom
import com.ed.paycontrol.VoucherPayment
import com.ed.schoolmanagement.User
import com.ed.service.Service
import com.ed.service.UserClassroom
import grails.converters.JSON
import org.hibernate.Query

class ReportsController {

    def index() {
        render ( [1:1] as JSON)
    }
    def getStudentsServicesPaid(Integer id){
        def UserClassroomList = UserClassroom.findAllByClassroom(Classroom.findById(id ?: params.int("id")))
        List<User> userList = new ArrayList<User>()
        for (UserClassroom uc : UserClassroomList) {
            if (uc.user.vouchersPaymentStudentAndService() > 0){
                userList.add(uc.user)
            }
        }
        render userList as JSON
    }
}
