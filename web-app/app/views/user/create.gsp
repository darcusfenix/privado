<%--
  Created by IntelliJ IDEA.
  User: alberto
  Date: 4/07/15
  Time: 10:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<ul>
    <li>Username: <input ng-model="userInstance.username" type="text"> </li>
    <li>Name: <input ng-model="userInstance.name" type="text"> </li>
    <li>Last Name: <input ng-model="userInstance.lastName" type="text"> </li>
    <li>Phone Number: <input ng-model="userInstance.phoneNumber" type="text"> </li>
</ul>
<button ng-click="saveUser()">Actualizar</button>
<button ng-click="cancelar()">Cancelar</button>