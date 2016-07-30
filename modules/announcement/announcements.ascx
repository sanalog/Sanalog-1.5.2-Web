<%@ Control Language="C#" AutoEventWireup="true" CodeFile="announcements.ascx.cs"
    Inherits="modules_duyuru_duyurular_resimli_sayfa" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>


<asp:Repeater ID="Rpt" runat="server">
    <ItemTemplate>
        <div class="post">
            <p class="post-head">
                <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("announce") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                    <%# Eval("Baslik") %> </a>
            </p>
            <p class="post-img">
                <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("announce") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                    <img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' class="img-responsive" />
                </a>
            </p>


        </div>
    </ItemTemplate>
</asp:Repeater>



<asp:Literal ID="LtrSayfalama" Text="" runat="server" />


