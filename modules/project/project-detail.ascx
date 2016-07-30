<%@ Control Language="C#" AutoEventWireup="true" CodeFile="project-detail.ascx.cs" Inherits="modules_proje_proje_detay" %>
<asp:FormView ID="FV" runat="server" DataSourceID="SDS" RenderOuterTable="False">
    <ItemTemplate>
        <%--metalar--%>
        <%# MetalariOlustur(Eval("Baslik"), Eval("Keyword"), Eval("Descr"),Eval("AramaIndex"),Eval("ProjeAdi"))%>
        <p class="post-head"><%# Eval("Baslik")%></p>
        <p class="post-text"><%# GeleriEmbed(Eval("Icerik")) %></p>
    </ItemTemplate>
</asp:FormView>

<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_ProjeAltBilgi_Icerik" SelectCommandType="StoredProcedure"
    OnSelected="SDS_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId"  Type="Int16" />
        <asp:QueryStringParameter Name="ProjeAltId" QueryStringField="paltid" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
