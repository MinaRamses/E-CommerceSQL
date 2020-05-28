<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhomepage.aspx.cs" Inherits="M3.adminhomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 15px;
            left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" CssClass="auto-style1" style="z-index: 1" Text="Activate Vendor" OnClick="Activate_vendor" />
    </form>
</body>
</html>
