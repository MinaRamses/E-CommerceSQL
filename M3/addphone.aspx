<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addphone.aspx.cs" Inherits="M3.addphone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 28px;
            left: 232px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 56px;
            left: 15px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 56px;
            left: 98px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add telephone number here
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="auto-style2" Text="Done" OnClick="addphone1" />
            <asp:Button ID="Button2" runat="server" CssClass="auto-style3" Text="Back" OnClick="back_phone" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
