<%@ Control Language="C#" AutoEventWireup="true" CodeFile="random-products.ascx.cs"
    Inherits="modules_urun_rasgele_urunler" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>
<div class="row list-products">
    <asp:Repeater runat="server" DataSourceID="SDSUrun">
        <ItemTemplate>
            <div class="col-md-3 product-wrapper">

                <p class="product-img">
                    <a href='<%# Eval("SeoUrl","/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("shop") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                        <img src='<%# Eval("Resim") %>' alt='<%# Eval("UrunAd") %>' class="img-responsive" /></a>
                </p>

                <div class="product-info">
                    <p class="product-name">
                        <a href='<%# Eval("SeoUrl","/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("shop") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                            <%# Eval("UrunAd") %></a>
                    </p>

                    <p class="product-price" runat="server" visible='<%# Eval("Fiyat") != DBNull.Value %>'><%# Eval("Fiyat","{0:N2}") %> <%# Eval("Simge") %></p>
                </div>



            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>


<asp:SqlDataSource ID="SDSUrun" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Urun_Rasgele" SelectCommandType="StoredProcedure"
    OnSelected="SDSUrun_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
        <asp:Parameter Name="Adet" Type="Byte" DefaultValue="4" />
    </SelectParameters>
</asp:SqlDataSource>
