<%@ Control Language="C#" AutoEventWireup="true" CodeFile="projects.ascx.cs"
    Inherits="modules_proje_kategorideki_projeler_sayfa_ici" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>><%= this.baslik %><asp:Literal ID="LtrKtgAd" runat="server" /></div>

<div id="projects">
    <asp:Repeater ID="Rpt" runat="server">
        <ItemTemplate>



            <p class="post-head"><a href='<%# LinkAyarla(Eval("ProjeUrl")) %>'><%# Eval("Baslik") %></a></p>
            <p class="post-img">
                <a href='<%# LinkAyarla(Eval("ProjeUrl")) %>'>
                    <img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' class="img-responsive" /></a>
            </p>
            <p class="post-text"><a href='<%# LinkAyarla(Eval("ProjeUrl")) %>'><%# Eval("Bilgi") %></a></p>



            <hr />
        </ItemTemplate>
    </asp:Repeater>
</div>

<asp:Literal ID="LtrSayfalama" Text="" runat="server" />

