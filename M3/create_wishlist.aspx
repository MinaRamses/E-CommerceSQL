<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create_wishlist.aspx.cs" Inherits="M3.create_wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 57px;
            left: 180px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 97px;
            left: 10px;
        }
        .auto-style3 {
            position: absolute;
            top: 97px;
            left: 100px;
            z-index: 1;
            width: 65px;
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            Enter Wishlist name</p>
       <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" style="z-index: 1; height: 29px;" Text="Done" OnClick="backtocust" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style3" Text="Back" OnClick="back_WL" />
    </form>
</body>
</html>
