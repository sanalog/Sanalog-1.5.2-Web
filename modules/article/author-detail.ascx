<%@ Control Language="C#" AutoEventWireup="true" CodeFile="author-detail.ascx.cs" Inherits="modules_makale_yazar_detay" %>

<div class="module-title" class="baslik" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>

<div class="row">

    <div class="col-md-9">

        <asp:Repeater ID="Rpt" runat="server">
            <ItemTemplate>

                <div class="post">

                    <p class="post-head">
                        <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                            <%# Eval("Baslik") %></a>
                    </p>
                    <p class="post-img">
                        <a href='<%# Eval("SeoUrl", "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("blog") + "/{0}" + Snlg_ConfigValues.urlExtension)%>'>
                            <img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' class="img-responsive" /></a>
                    </p>
                    <p class="post-info">
                        <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_baslik").ToString() %>: </strong>03 Kasım 2015</span>
                        <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_kategori").ToString() %>:</strong> <%# MakaleKategoriListesi(Eval("MakId").ToString())%></span>
                        <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_yorum").ToString() %>: </strong>(<%# Eval("YorumSay", "{0}") %>)</span>
                    </p>
                    <p class="post-text"><%# Eval("Bilgi") %></p>

                </div>

            </ItemTemplate>
        </asp:Repeater>
        <asp:Literal ID="LtrSayfalama" Text="" runat="server" />
    </div>



    <div class="col-md-3">
        <div class="author-item">
            <p class="author-image">
                <img src='<%= resim %>' alt='<%= Snlg_MemberInfo.s_UserName %>' class="img-responsive" /></p>
            <p class="author-name"><%= isim %></p>
            <p class="author-info"><%= bilgi %></p>
        </div>
    </div>


</div>



