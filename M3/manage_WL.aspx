<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_WL.aspx.cs" Inherits="M3.manage_WL" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            position: absolute;
            top: 138px;
            left: 17px;
            z-index: 1;
            width: 73px;
            height: 26px;
        }
        .auto-style4 {
            position: absolute;
            top: 137px;
            left: 111px;
            z-index: 1;
            width: 74px;
            height: 30px;
        }
        .auto-style6 {
            position: absolute;
            top: 182px;
            left: 65px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 65px;
            left: 254px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 20px;
            left: 234px;
            z-index: 1;
            margin-top: 3px;
        }
        .auto-style10 {
            direction: ltr;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <br />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style4" Text="Remove" OnClick="remove" />
        <asp:Button ID="Button3" runat="server" CssClass="auto-style6" Text="Back" OnClick="back" />
        Enter Your Wishlist Name:<br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style9"></asp:TextBox>
        <p class="auto-style10">
        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Text=" Add " OnClick="Button1_Click" />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style7"></asp:TextBox>
            Enter the Serial no of the Product:</p>
    </form>
</body>
</html>

