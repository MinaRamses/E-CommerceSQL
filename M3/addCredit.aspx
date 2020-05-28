<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCredit.aspx.cs" Inherits="M3.addCredit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 24px;
            left: 266px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 109px;
            left: 131px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 159px;
            left: 41px;
            z-index: 1;
            width: 102px;
            height: 45px;
        }
        .auto-style4 {
            position: absolute;
            top: 159px;
            left: 157px;
            z-index: 1;
            width: 102px;
            height: 45px;
            right: 958px;
        }
        .auto-style5 {
            position: absolute;
            top: 67px;
            left: 286px;
            z-index: 1;
        }
        .auto-style6 {
            direction: ltr;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <br />
        Enter Your Credit Card Number:<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
        <br />
        <br />
        Enter Expiry Date (YYYY/MM/DD):
        <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style5"></asp:TextBox>
        <br />
        <br />
        Enter Your CVV:<asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style2"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style3" Text="Add Card" OnClick="Done" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style4" Text="Back" OnClick="back_from_CC" />
    </form>
    <p class="auto-style6">
        &nbsp;</p>
</body>
</html>
