﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="admin_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="1" width="80%">
              <tr>
                  <td>用户名</td><td>密码</td><td>权限</td><td>删除</td><td>更新</td>
              </tr>
                   <%

                       string id = Request.QueryString["id"];

                       if (id != null)
                       {
                           BLL.User.del(int.Parse(id));
                           JH.JsHelper.AlertAndRedirect("删除成功！", "user.aspx");
                       }

                       List<Model.User> list = BLL.User.list();
                       
                       for (int i= 0; i<list.Count; i++)
                        {
                            string status = "";
                            if (list[i].Status == 1)
                            {
                                status = "管理员";
                            }
                            else if(list[i].Status == 0)
                            {
                                status = "访客";
                            }
                            else
                            {
                                status = "禁用";
                            }

                            %>
                   <tr>
                       <td><%=list[i].Name %></td><td><%=list[i].Password %></td><td><%=status %></td>
                       <td><a href="user.aspx?id=<%=list[i].Id %>">删除</a></td><td><a href="user_edit.aspx?id=<%=list[i].Id %>">更新</a></td>
                   </tr>
                   <%} %>

            </table>
        </div>
    </form>
</body>
</html>