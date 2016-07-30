<%@ Control Language="C#" AutoEventWireup="true" CodeFile="category-menu.ascx.cs"
    Inherits="modules_proje_kategori_menu_resimsiz" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>
<asp:Literal ID="ltrKtg" Text="" runat="server" />




