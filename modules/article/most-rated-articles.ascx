<%@ Control Language="C#" AutoEventWireup="true" CodeFile="most-rated-articles.ascx.cs"
    Inherits="modules_makale_en_cok_puanlanan_makaleler" %>


    <div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
        <%= this.baslik %>
    </div>
    <ul>
        <asp:Repeater runat="server" DataSourceID="SDSMak">
            <ItemTemplate>
                <li><a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                    <%# Eval("Baslik") %></a>
                    <p><%#Convert.ToDateTime(Eval("Tarih")).ToString("dd MMMM yyyy")%></p>
                </li>

            </ItemTemplate>
        </asp:Repeater>
    </ul>


<hr />

<asp:SqlDataSource ID="SDSMak" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Makale_EnCokPuanlanan" SelectCommandType="StoredProcedure"
    OnSelected="SDSMak_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId"  Type="Int16" />
        <asp:Parameter Name="Adet" Type="Byte" DefaultValue="5" />
    </SelectParameters>
</asp:SqlDataSource>
