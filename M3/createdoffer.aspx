<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createdoffer.aspx.cs" Inherits="M3.createdoffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 78px;
            left: 134px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 143px;
            left: 177px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 212px;
            left: 75px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 212px;
            left: 237px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Please Enter the following data to create an Offer<br />
        <br />
        Offer Amount :<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
        <br />
        <br />
        <br />
        Offer Expiary Date :<asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style2"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style4" Text="Create Offer" OnClick="createofferv" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style5" Text="Back" OnClick="Button2_Click" style="height: 29px" />
    </form>
</body>
</html>
