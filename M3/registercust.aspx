<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registercust.aspx.cs" Inherits="M3.registercust" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 39px;
            left: 110px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 79px;
            left: 110px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 115px;
            left: 110px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 155px;
            left: 113px;
            z-index: 1;
            right: 1569px;
        }
        .auto-style6 {
            position: absolute;
            top: 243px;
            left: 111px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 198px;
            left: 107px;
            z-index: 1;
            margin-top: 0px;
        }
        .auto-style9 {
            position: absolute;
            top: 278px;
            left: 119px;
            z-index: 1;
        }
        .auto-style10 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div class="auto-style10">
            <br />
            <br />
            Username<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1" ></asp:TextBox>
            <br />
        </div>
            <br />
        <br />
            <br />
        First Name<asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style2" ></asp:TextBox>
        <br />
        <br />
        Last Name<asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style3"></asp:TextBox>
        <br />
        <br />
        Password<asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="auto-style4"></asp:TextBox>
        <br />
            <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style8"></asp:TextBox>
        <br />
        E-mail<br />
        <br />
        
        <asp:Button ID="Button1" runat="server" CssClass="auto-style6" Text="Register" OnClick="Register" />
        </div>
        <asp:Button ID="Button2" runat="server" CssClass="auto-style9" Text="Back" OnClick="Back_custreg" />
    </form>
</body>
</html>
