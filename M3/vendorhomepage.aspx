<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vendorhomepage.aspx.cs" Inherits="M3.vendorhomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 15px;
            left: 10px;
            z-index: 1;
            width: 130px;
        }
        .auto-style2 {
            position: absolute;
            top: 59px;
            left: 10px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 97px;
            left: 10px;
        }
        .auto-style4 {
            position: absolute;
            top: 217px;
            left: 17px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            left: 10px;
            z-index: 1;
            top: 185px;
        }
        .auto-style6 {
            position: absolute;
            top: 255px;
            left: 0px;
            z-index: 1;
        }
        .auto-style7 {
            direction: ltr;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style1" OnClick="post_Prod" Text="Post Product" />
        </div>
        <p>
            <asp:Button ID="Button2" runat="server" CssClass="auto-style2" Text="View Product I posted" OnClick="Button2_Click" />
        </p>
        <p>
        <asp:Button ID="Button3" runat="server" CssClass="auto-style3" style="z-index: 1" Text="Edit Products" OnClick="Button3_Click" />
        </p>
        <asp:Button ID="Button6" runat="server" CssClass="auto-style6" Text="Remove Expired Offer" />
        <p class="auto-style7">
            &nbsp;</p>
        <p>
            <asp:Button ID="Button5" runat="server" CssClass="auto-style4" Text="Add Offer" OnClick="Button5_Click" />
        <asp:Button ID="Button4" runat="server" CssClass="auto-style5" Text="Create Offer" OnClick="createoffer" />
        </p>
    </form>
</body>
</html>
