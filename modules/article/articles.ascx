<%@ Control Language="C#" AutoEventWireup="true" CodeFile="articles.ascx.cs"
    Inherits="modules_makale_en_son_eklenen_makaleler_sayfa" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>><%= this.baslik %></div>

<asp:Repeater runat="server" ID="Rpt">
    <ItemTemplate>
        <div class="post">

            <p class="post-head"><a href='<%# Eval("SeoUrl","/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'><%# Eval("Baslik") %></a></p>

            <p class="post-img">
                <a href='<%# Eval("SeoUrl","/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                    <img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' class='img-responsive' /></a>
            </p>


            <p class="post-info">
                <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_baslik").ToString() %>:</strong> <%#Convert.ToDateTime(Eval("Tarih")).ToString("dd MMMM yyyy")%></span>
                <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_yazar").ToString() %>:</strong> <%# Eval("Yazar") %></span>
                <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_kategori").ToString() %>:</strong> <%# MakaleKategoriListesi(Eval("MakId").ToString())%></span>
                <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_yorum").ToString() %>:</strong> (<%# Eval("YorumSay") %>)</span>
            </p>


            <p class="post-text"><a href='<%# Eval("SeoUrl","/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'><%# Eval("Bilgi") %></a></p>

        </div>

    </ItemTemplate>
</asp:Repeater>

<asp:Literal ID="LtrSayfalama" Text="" runat="server" />

