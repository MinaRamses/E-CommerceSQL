<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerhomepage.aspx.cs" Inherits="M3.customerhomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 16px;
            left: 19px;
            z-index: 1;
            width: 170px;
            right: 1095px;
        }
        .auto-style2 {
            position: absolute;
            top: 51px;
            left: 16px;
            z-index: 1;
            width: 175px;
            height: 26px;
        }
        .auto-style3 {
            position: absolute;
            top: 86px;
            left: 15px;
            z-index: 1;
            width: 178px;
            height: 24px;
        }
        .auto-style4 {
            position: absolute;
            top: 119px;
            left: 15px;
            z-index: 1;
            width: 311px;
            height: 28px;
        }
        .auto-style5 {
            position: absolute;
            top: 154px;
            left: 16px;
            z-index: 1;
            width: 235px;
            height: 24px;
        }
        .auto-style6 {
            position: absolute;
            top: 185px;
            left: 10px;
            z-index: 1;
            width: 264px;
            height: 37px;
        }
        .auto-style7 {
            position: absolute;
            top: 225px;
            left: 14px;
            z-index: 1;
        }
    </style>
</head>
<body style="height: 228px">
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style1" Text="Add telephone number" OnClick="Button1_Click" />
            <asp:Button ID="Button3" runat="server" CssClass="auto-style3" OnClick="Button3_Click" Text="Create WishList" />
        </div>
        <p>
            <asp:Button ID="Button2" runat="server" CssClass="auto-style2" Text="View all products" OnClick="Button2_Click" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button4" runat="server" CssClass="auto-style4" Text="Add/Remove products from Wishlist" OnClick="manage" />
            <asp:Button ID="Button5" runat="server" CssClass="auto-style5" Text="Add Credit Card" OnClick="CreditCard" />
        </p>
        <asp:Button ID="Button6" runat="server" CssClass="auto-style6" Text="Add/Remove products from Cart" OnClick="manage_cart" />
        <asp:Button ID="Button7" runat="server" CssClass="auto-style7" Text="Make An Order" OnClick="make_order" />
    </form>
</body>
</html>
