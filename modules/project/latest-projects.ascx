<%@ Control Language="C#" AutoEventWireup="true" CodeFile="latest-projects.ascx.cs"
    Inherits="modules_proje_en_son_eklenen_projeler" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %></div>


    <ul class="list-inline" id="last-projects">
        <asp:Repeater runat="server" DataSourceID="SDSMak">
            <ItemTemplate>
                <li><a class="wrapper" title='<%# Eval("Baslik") %>' href='<%# LinkAyarla(Eval("ProjeUrl")) %>'>
                    <img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' title='<%# Eval("Baslik") %>' class="img-responsive" /></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>


<asp:SqlDataSource ID="SDSMak" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Proje_EnSonEklenen" SelectCommandType="StoredProcedure" OnSelected="SDSMak_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId"  Type="Int16" />
        <asp:Parameter Name="Adet" Type="Byte" DefaultValue="5" />
    </SelectParameters>
</asp:SqlDataSource>
