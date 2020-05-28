<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="postProd.aspx.cs" Inherits="M3.postProd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 334px;
        }
        .auto-style3 {
            position: absolute;
            top: 42px;
            left: 114px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 75px;
            left: 76px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 110px;
            left: 159px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 152px;
            left: 58px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 191px;
            left: 62px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 276px;
            left: 18px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 275px;
            left: 180px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style2">
        <div>
            Add the description of the Product:</div>
        <p>
            Product Name:<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style3"></asp:TextBox>
        </p>
        Category:<asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style4"></asp:TextBox>
        <br />
        <br />
        Product Description:<asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style5"></asp:TextBox>
        <br />
        <br />
        Price:<asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style6"></asp:TextBox>
        <br />
        <br />
        Color:<asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style7"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style8" Text="Add Product" OnClick="add_product" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style9" Text="Back" OnClick="back_postProd" />
    </form>
</body>
</html>
