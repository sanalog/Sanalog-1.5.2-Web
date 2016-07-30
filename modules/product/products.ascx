<%@ Control Language="C#" AutoEventWireup="true" CodeFile="products.ascx.cs"
    Inherits="modules_urun_kategorideki_urunler" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>

<p class="cat-head">
    <asp:Literal ID="LtrKtgAd" runat="server" /></p>

<div class="row list-products">
    <asp:Repeater ID="Rpt" runat="server">
        <ItemTemplate>
            <div class="col-md-3 product-wrapper">
                <p class="product-img">
                    <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("shop") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                        <img src='<%# Eval("Resim") %>' alt='<%# Eval("UrunAd") %>' class="img-responsive" /></a>
                </p>
                <div class="product-info">
                    <p class="product-name">
                        <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("shop") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'><%# Eval("UrunAd") %> </a>
                    </p>

                    <p class="product-price" runat="server" visible='<%# Eval("Fiyat") != DBNull.Value %>'>
                        <%# Eval("Fiyat","{0:N2}") %> <%# Eval("Simge") %>
                    </p>

                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

</div>
<asp:Literal ID="LtrSayfalama" Text="" runat="server" />