<%@ Control Language="C#" AutoEventWireup="true" CodeFile="references.ascx.cs"
    Inherits="modules_referans_kategorideki_referanslar_sayfa" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>
<div class="row text-center">

    <asp:Repeater ID="Rpt" runat="server">
        <ItemTemplate>
            <div class="col-md-3 references-box">
                <p><a href='<%# Eval("Link")%>'><img src='<%# Eval("Resim") %>' alt='<%# Eval("Firma") %>' /></a></p>
                <p><a href='<%# Eval("Link")%>'><%# Eval("Firma")%></a></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<div class="clear">
</div>
<asp:Literal ID="LtrSayfalama" Text="" runat="server" />
