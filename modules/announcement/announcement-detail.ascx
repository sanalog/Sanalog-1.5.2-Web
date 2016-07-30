<%@ Control Language="C#" AutoEventWireup="true" CodeFile="announcement-detail.ascx.cs"
    Inherits="modules_duyuru_duyuru_detay" %>
     <div class="post">

        <asp:FormView ID="FV" runat="server" DataSourceID="SDS" RenderOuterTable="False">
            <ItemTemplate>


                <p class="post-head"><%# Eval("Baslik")%></p>
                
  <div class="post-info">
                    <span><%# Eval("Tarih", "{0:d}")%></span>
     </div>

                     <p class="post-img"><img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' class="img-responsive"/></p>


                 <p class="post-text"><%# GeleriEmbed(Eval("Duyuru")) %></p>

                <%--metalar--%>
                <%# MetalariOlustur(Eval("Baslik"), Eval("Baslik"), Eval("Baslik"),Eval("AramaIndex"))%>
            </ItemTemplate>
        </asp:FormView>
    </div>

<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Duyuru_Detay" SelectCommandType="StoredProcedure"
    OnSelected="SDS_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
        <asp:QueryStringParameter Name="DuyuruId" QueryStringField="dyrid" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
