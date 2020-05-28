<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activateven.aspx.cs" Inherits="M3.activateven" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 46px;
            left: 12px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 90px;
            left: 14px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 90px;
            left: 137px;
            z-index: 1;
            width: 63px;
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Enter Vendor Username to get activated:</div>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Text="Activate" OnClick="activate_ven" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style3" Text="Back" OnClick="Button2_Click" />
    </form>
</body>
</html>
