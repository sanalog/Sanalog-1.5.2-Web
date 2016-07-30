<%@ Control Language="C#" AutoEventWireup="true" CodeFile="page-content.ascx.cs" Inherits="modules__diger_sayfa_detay" %>

<asp:FormView ID="FV" runat="server" DataSourceID="SDS" RenderOuterTable="False">
    <ItemTemplate>
        <%--metalar--%>
        <%# MetalariOlustur(Eval("Title"), Eval("Keyword"), Eval("Descr"), Eval("AramaIndex"))%>
        
            <%# GeleriEmbed(Eval("Icerik")) %>
      
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_SayfaDetayGetir" SelectCommandType="StoredProcedure"
    OnSelected="SDS_Selected">
    <SelectParameters>

        <asp:SessionParameter Name="Dil" SessionField="ZDilId"  Type="Int16" />
        <asp:QueryStringParameter Name="SayfaId" QueryStringField="syf" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
