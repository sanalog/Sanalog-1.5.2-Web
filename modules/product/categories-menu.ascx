<%@ Control Language="C#" AutoEventWireup="true" CodeFile="categories-menu.ascx.cs"
    Inherits="modules_urun_kategori_menu_resimsiz" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>><%= this.baslik %></div>

<asp:Literal ID="ltrKtg" Text="" runat="server" />
