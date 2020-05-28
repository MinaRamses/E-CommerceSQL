<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manage_cart.aspx.cs" Inherits="M3.manage_cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 56px;
            left: 312px;
        }
        .auto-style2 {
           position: absolute;
            top: 100px;
            left: 37px;
            z-index: 1;
            margin-top: 0px;
            width: 83px;
            right: 996px;
        }
        .auto-style3 {
            position: absolute;
            top: 100px;
            left: 132px;
            z-index: 1;
            margin-top: 0px;
        }
        .auto-style4 {
            position: absolute;
            top: 143px;
            left: 41px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            Please Enter Serial no of the Product:
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1" style="z-index: 1"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Text="Add" OnClick="add_cart" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style3" Text="Remove" OnClick="remove_fromCart" />
        <asp:Button ID="Button3" runat="server" CssClass="auto-style4" Text="Back" OnClick="back_from_Cart" />
    </form>
</body>
</html>
