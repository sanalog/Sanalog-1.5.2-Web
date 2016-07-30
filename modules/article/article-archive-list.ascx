<%@ Control Language="C#" AutoEventWireup="true" CodeFile="article-archive-list.ascx.cs"
    Inherits="modules_makale_arsiv_blok" %>


    <div class="module-title" class="baslik" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
        <%= this.baslik %>
    </div>
    <ul>

        <asp:Repeater runat="server" DataSourceID="SDSMak">
            <ItemTemplate>
                <li><%# LinkOlustur(Eval("Yil"),Eval("Ay")) %> <span>(<%#Eval("Sayi") %>)</span></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>


<hr />


<asp:SqlDataSource ID="SDSMak" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Makale_ArsivList" SelectCommandType="StoredProcedure"
    OnSelected="SDSMak_Selected"></asp:SqlDataSource>
