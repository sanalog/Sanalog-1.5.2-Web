<%@ Control Language="C#" AutoEventWireup="true" CodeFile="latest-news.ascx.cs"
    Inherits="modules_haber_son_haberler" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>

<div class="marquee">
    <asp:Repeater runat="server" DataSourceID="SDS">
        <ItemTemplate>

            <%--<a href='<%# Eval("SeoUrl", "/" + sabitlerZiyaretci.s_Dil + "/" + Snlg_Sabitler.GetUrlValueByKey("news") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                                    <img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' />
                                </a>--%>

            <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("news") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                <%# Eval("Baslik") %></a>
            <div class="bilgi hide">
                <%# Eval("Bilgi") %>
            </div>

        </ItemTemplate>
    </asp:Repeater>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("[src='']").hide();

        $('.marquee').marquee({
            //speed in milliseconds of the marquee
            duration: 10000,
            //gap in pixels between the tickers
            gap: 50,
            //time in milliseconds before the marquee will start animating
            delayBeforeStart: 0,
            //'left' or 'right'
            direction: 'up',
            //true or false - should the marquee be duplicated to show an effect of continues flow
            duplicated: true
        });
    });
</script>


<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Haber_SonEklenen" SelectCommandType="StoredProcedure" OnSelected="SDS_Selected">
    <SelectParameters>

        <asp:SessionParameter Name="Dil" SessionField="ZDilId"  Type="Int16" />
        <asp:Parameter Name="Adet" Type="Byte" DefaultValue="5" />
    </SelectParameters>
</asp:SqlDataSource>
