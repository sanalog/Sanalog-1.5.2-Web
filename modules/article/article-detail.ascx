<%@ Control Language="C#" AutoEventWireup="true" CodeFile="article-detail.ascx.cs"
    Inherits="modules_makale_makale_detay" EnableViewState="false" %>


<asp:FormView ID="FV" runat="server" DataSourceID="SDS" RenderOuterTable="False">
    <ItemTemplate>

        <div class="post">

            <p class="post-head"><%# Eval("Baslik") %></p>


            <p class="post-img">
                <img src='<%# Eval("Resim") %>' alt='<%# Eval("Baslik") %>' class='img-responsive' /></p>

            <div class="post-info">
                <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_baslik").ToString() %>: </strong><%#Convert.ToDateTime(Eval("Tarih")).ToString("dd MMMM yyyy")%></span>
                <span><strong><%=GetGlobalResourceObject("default", "makale_info_yayın_yazar").ToString() %>: </strong><%# Eval("Yazar") %></span>
                <span><strong><a href="#comments" class="internal"><%=GetGlobalResourceObject("default", "makale_info_yayın_yorum").ToString() %>: </a></strong>(<%# Eval("YorumSayisi") %>)</span>
                <div class="rating">
                    <div id="oyla"></div>

                    <input type="hidden" name="rating" value="5" />
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#<%= UserControlClientID %> .rating #oyla').raty({
                                    readOnly: true, path: '/scripts/jquery.raty-2.4.5/img/', number: 5, score: <%#Eval("Puan")%>, starOn: 'star-on.png', starOff: 'star-off.png',
                                    click: function (score, evt) { $('#<%= UserControlClientID %> .rating input[name=rating]').val(score); }
                                });
                            });
                    </script>

                </div>
            </div>
            <p class="post-text"><%# GeleriEmbed(Eval("Icerik"))%></p>

            <p class="tags"><%=GetGlobalResourceObject("default", "makale_detay_etiket_head").ToString() %>: <%# MakaleTaglar(Eval("MakId").ToString())%></p>

        </div>


        <%--Gorunurluk Kontrolü--%>
        <%# GorunurlukKontrol(Eval("Gorunurluk"))%>
        <%--metalar--%>
        <%# MetalariOlustur(Eval("Baslik"), Eval("Keyword"), Eval("Descr"),Eval("AramaIndex"))%>
    </ItemTemplate>
</asp:FormView>

<hr />


<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Makale_Icerik" SelectCommandType="StoredProcedure"
    OnSelected="SDS_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
        <asp:QueryStringParameter Name="MakId" QueryStringField="makid" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
