<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registerven.aspx.cs" Inherits="M3.registerven" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 18px;
            left: 110px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 57px;
            left: 110px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 95px;
            left: 110px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 130px;
            left: 113px;
            z-index: 1;
            right: 1569px;
        }
        .auto-style6 {
            position: absolute;
            top: 318px;
            left: 112px;
            z-index: 1;
        }
        .auto-style7 {
            direction: ltr;
        }
        .auto-style8 {
            position: absolute;
            top: 196px;
            left: 139px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 227px;
            left: 188px;
            z-index: 1;
        }
        .auto-style10 {
            position: absolute;
            top: 163px;
            left: 127px;
            z-index: 1;
        }
        .auto-style11 {
            position: absolute;
            top: 354px;
            left: 123px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style7">
        <div>
            <br />
            Username<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1" ></asp:TextBox>
            <br />
        </div>
        <br />
        First Name<asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style2" OnTextChanged="TextBox2_TextChanged" ></asp:TextBox>
        <br />
        <br />
        Last Name<asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style3"></asp:TextBox>
        <br />
        <br />
        Password<asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="auto-style4"></asp:TextBox>
        <br />
        <br />
        E-mail<asp:TextBox ID="TextBox8" runat="server" CssClass="auto-style10"></asp:TextBox>
            <br />
            <br />
            Company name<asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style8"></asp:TextBox>
            <br />
            <br />
            Bank Account
          Number<asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style9"></asp:TextBox>
 <br />
        <br />
        
        <asp:Button ID="Button2" runat="server" CssClass="auto-style6" Text="Register" OnClick="Register" />
            <asp:Button ID="Button3" runat="server" CssClass="auto-style11" Text="Back" OnClick="Back_venreg" />
        </div>
    </form>
</body>
</html>
