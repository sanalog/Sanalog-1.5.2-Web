<%@ Control Language="C#" AutoEventWireup="true" CodeFile="reference-categories.ascx.cs" Inherits="modules_portfolio_reference_categories" %>


<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>><%= this.baslik %></div>

<ul data-snlg='menu'>
    <asp:Literal ID="ltrKtg" Text="" runat="server" />
</ul>
