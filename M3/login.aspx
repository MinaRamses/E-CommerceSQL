<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="M3.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style6 {
            position: absolute;
            top: 154px;
            left: 17px;
            z-index: 1;
            width: 183px;
        }
        .auto-style7 {
            position: absolute;
            top: 187px;
            left: 17px;
            z-index: 1;
            width: 184px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lbl_username" runat="server" Text="Username: "></asp:Label>
    
        <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
    
        <br />
    
        <br />
        <asp:Label ID="lbl_password" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
    
        <br />
    
        <asp:Button ID="registerC" runat="server" CssClass="auto-style6" Text="Register as a Customer" OnClick="registercust" />
    
        <asp:Button ID="btn_login" runat="server" Text="Login" onclick="Login" Width="90px"/>

         <asp:Button ID="registerV" runat="server" CssClass="auto-style7" Text="Register as a Vendor" OnClick="registerven" />
    
    </div>
        <p>
    
           
        </p>
    </form>
</body>
</html>