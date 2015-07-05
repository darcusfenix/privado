<%@ page contentType="text/html;charset=UTF-8" %>
<li ng-repeat="user in userList">
  <br>
  <b>{{user.username}}</b>
  <br>
  <b>{{user.phoneNumber}}</b>
</li>