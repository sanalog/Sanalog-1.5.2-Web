<%@ Control Language="C#" AutoEventWireup="true" CodeFile="categories-list.ascx.cs"
    Inherits="modules_makale_kategoriler_resimsiz_blok" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>><%= this.baslik %></div>

<asp:Literal ID="ltrKtg" Text="" runat="server" />
