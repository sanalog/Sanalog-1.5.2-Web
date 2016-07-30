<%@ Control Language="C#" AutoEventWireup="true" CodeFile="latest-references.ascx.cs"
    Inherits="modules_referans_en_son_eklenen_referanslar" %>

    <div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>><%= this.baslik %></div>


    <ul class="list-inline list-last-references">
        <asp:Repeater runat="server" DataSourceID="SDSMak">
            <ItemTemplate>
                <li>
                    <a href='<%# Eval("Link")%>'>
                        <img src='<%# Eval("Resim") %>' alt='<%# Eval("Firma") %>' title='<%# Eval("Firma") %>' class="img-responsive" /></a>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>


<asp:SqlDataSource ID="SDSMak" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Referans_EnSonEklenen" SelectCommandType="StoredProcedure"
    OnSelected="SDSMak_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId"  Type="Int16" />
        <asp:Parameter Name="Adet" Type="Byte" DefaultValue="8" />
    </SelectParameters>
</asp:SqlDataSource>
