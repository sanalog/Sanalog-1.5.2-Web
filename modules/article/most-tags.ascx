<%@ Control Language="C#" AutoEventWireup="true" CodeFile="most-tags.ascx.cs" Inherits="modules_article_most_tags" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>><%= this.baslik %></div>

<asp:Literal ID="LtrTAgs" runat="server" />
<hr />