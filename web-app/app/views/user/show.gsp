<%--
  Created by IntelliJ IDEA.
  User: alberto
  Date: 4/07/15
  Time: 10:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<li>{{userInstance.username}}</li>
<li>{{userInstance.name}}</li>
<li>{{userInstance.lastName}}</li>
<li>{{userInstance.phoneNumber}}</li>
<button ng-click="editUser()">Editar</button>
<button ng-click="deleteUser()">Eliminar</button>