<%@ Control Language="C#" AutoEventWireup="true" CodeFile="news-detail.ascx.cs" Inherits="modules_haber_haber_detay" %>

<asp:FormView ID="FV" runat="server" DataSourceID="SDS" RenderOuterTable="False">
    <ItemTemplate>


        <div class="post">

            <p class="post-head"><%# Eval("Baslik")%></p>

            <div class="post-info">
                <span><%# Eval("Tarih", "{0:d}")%></span>
            </div>

            <p class="post-img">
                <img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' class="img-responsive" /></p>

            <p class="post-main-text"><%# Eval("Bilgi")%></p>

             <p class="post-text"><%# GeleriEmbed(Eval("Haber")) %></p>


            <%--metalar--%>
            <%# MetalariOlustur(Eval("Baslik"), Eval("Baslik"), Eval("Bilgi"),Eval("AramaIndex"))%>
        </div>

    </ItemTemplate>
</asp:FormView>
</div>
<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Haber_Detay" SelectCommandType="StoredProcedure" OnSelected="SDS_Selected">
    <SelectParameters>

        <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
        <asp:QueryStringParameter Name="HaberId" QueryStringField="hbrid" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
