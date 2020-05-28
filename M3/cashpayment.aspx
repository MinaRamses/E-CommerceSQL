<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cashpayment.aspx.cs" Inherits="M3.cashpayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 703px;
            height: 22px;
            position: absolute;
            top: 37px;
            left: 10px;
        }
        .auto-style2 {
            position: absolute;
            top: 0px;
            left: 111px;
        }
        .auto-style3 {
            width: 703px;
            height: 181px;
            position: absolute;
            top: 37px;
            left: 10px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 44px;
            left: 123px;
        }
        .auto-style6 {
            position: absolute;
            top: 88px;
            left: 39px;
            z-index: 1;
        }
        .auto-style7 {
            position: absolute;
            top: 88px;
            left: 123px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Panel ID="Panel1" runat="server" CssClass="auto-style3">
            Cash amount:
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style2" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            Points (if any):
            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style4" style="z-index: 1"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style6" Text="Done" />
            <asp:Button ID="Button2" runat="server" CssClass="auto-style7" Text="Back" OnClick="Button2_Click" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" CssClass="auto-style1" style="z-index: 1">
        </asp:Panel>
    </form>
</body>
</html>
