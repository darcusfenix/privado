package com.ed.schoolmanagement.marshallers

import com.ed.schoolmanagement.User
import grails.converters.JSON

/**
 * Created by alberto on 9/07/15.
 */
class UserMarshaller {
    void register() {
        JSON.registerObjectMarshaller(User) { User user ->
            return [
                    id              : user.id,
                    name            : user.name,
                    lastName        : user.lastName,
                    phoneNumber     : user.phoneNumber,
                    address         : user.address,
                    username        : user.username,
                    password        : user.password,
                    enabled         : user.enabled,
                    mobileNumber    : user.mobileNumber,
                    email           : user.email,
                    socialNetworkUrl: user.socialNetworkUrl,
                    authority    : user.getAuthorities()[0],

            ]
        }
    }
}
