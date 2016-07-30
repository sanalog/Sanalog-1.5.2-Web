<%@ Control Language="C#" AutoEventWireup="true" CodeFile="random-authors.ascx.cs" Inherits="modules_article_authors_random" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>

<asp:Repeater runat="server" DataSourceID="SDS">
    <ItemTemplate>

        <div class="author-item">
            <p class="author-image">
               <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("editor") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                        <img src='<%# Eval("Resim") %>' alt='<%# Eval("UyeAd") %>' class="img-responsive" /></a>
            
            </p>
             <p class="author-name">
                <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("editor") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                    <%# Eval("UyeAd") %></a>
            </p>
        


        <asp:Repeater runat="server" DataSourceID="SDSMakale">
            <ItemTemplate>
                <p class="author-article"><a href='<%# Eval("SeoUrl","/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'><%# Eval("Baslik") %></a></p>

                <p class="author-date"><%#Convert.ToDateTime(Eval("Tarih")).ToString("dd MMMM yyyy")%></p>
            </ItemTemplate>
        </asp:Repeater>
</div>

        <asp:HiddenField ID="HdnMakID" runat="server" Value='<%# Eval("SonMakaleID") %>' />
        <asp:SqlDataSource ID="SDSMakale" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
            SelectCommand="snlg_V1.zsp_Makale_Icerik" SelectCommandType="StoredProcedure"
            OnSelected="SDS_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
                <asp:ControlParameter Name="MakId" ControlID="HdnMakID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </ItemTemplate>
</asp:Repeater>
<hr />

<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Makale_Yazarlar" SelectCommandType="StoredProcedure" OnSelected="SDS_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
        <asp:Parameter Name="Adet" DefaultValue="3" Type="Byte" />
        <asp:Parameter Name="SorguTip" DefaultValue="2" Type="Byte" />
    </SelectParameters>
</asp:SqlDataSource>

