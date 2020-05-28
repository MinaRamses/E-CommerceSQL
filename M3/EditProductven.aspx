<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProductven.aspx.cs" Inherits="M3.EditProductven" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 65px;
            left: 101px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 101px;
            left: 131px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 134px;
            left: 96px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 166px;
            left: 178px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 208px;
            left: 73px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 247px;
            left: 57px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 335px;
            left: 10px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 334px;
            left: 97px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            Please Enter the following data to update a Product:<br />
            <br />
            Serial no. :<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
            <br />
            Product name :<asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style2"></asp:TextBox>
            <br />
            <br />
            Category :<asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style3"></asp:TextBox>
            <br />
            <br />
            Product Description :<asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style4"></asp:TextBox>
            <br />
            <br />
            Price :
            <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style5"></asp:TextBox>
            <br />
            <br />
            Color :<asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style6"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style7" Text="Edit" OnClick="Editpven" />
        <p>
            <asp:Button ID="Button2" runat="server" CssClass="auto-style8" Text="Back" OnClick="Button2_Click" />
        </p>
    </form>
</body>
</html>
