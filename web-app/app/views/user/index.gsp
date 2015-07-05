<%@ page contentType="text/html;charset=UTF-8" %>
<hr>
<a href="#/user/create">Crear Usuario</a>
<hr>
<li ng-repeat="user in userList">
  <br>
  <b><a href="#/user/show/{{user.id}}">{{user.username}}</a></b>
  <br>
  <b>{{user.phoneNumber}}</b>
</li>