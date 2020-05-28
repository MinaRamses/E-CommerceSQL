<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payorder.aspx.cs" Inherits="M3.payorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 37px;
            left: 10px;
        }
        .auto-style2 {
            position: absolute;
            top: 37px;
            left: 104px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 101px;
            left: 59px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style1" style="z-index: 1" Text="Cash" />
        <asp:Button ID="Button2" runat="server" CssClass="auto-style2" Text="Credit Card" />
        <asp:Button ID="Button3" runat="server" CssClass="auto-style3" Text="Back" OnClick="Button3_Click" />
    </form>
</body>
</html>
