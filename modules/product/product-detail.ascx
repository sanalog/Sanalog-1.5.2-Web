<%@ Control Language="C#" AutoEventWireup="true" CodeFile="product-detail.ascx.cs"
    Inherits="modules_urun_urun_detay" %>
<asp:FormView ID="FV" runat="server" DataSourceID="SDS" RenderOuterTable="False"
    OnDataBound="FV_DataBound">
    <ItemTemplate>
        <%--Gorunurluk Kontrolü--%>
        <%# GorunurlukKontrol(Eval("Gorunurluk"))%>
        <%--metalar--%>
        <%# MetalariOlustur(Eval("UrunAd"), Eval("Keyword"), Eval("Descr"),Eval("AramaIndex"))%>
        <!-- Slider -->
        <div class="row mb-lg">
            <div class="col-sm-6" id="slider">
                <!-- Top part of the slider -->
                <div id="carousel-bounding-box">
                    <div class="carousel slide mb-md" id="myCarousel">
                        <!-- Carousel items -->
                        <div class="carousel-inner">
                            <asp:Repeater runat="server" DataSourceID="SDSResim">
                                <ItemTemplate>
                                    <div class="item" data-slide-number="<%# Container.ItemIndex + 0 %>">
                                        <img src="<%# Eval("Resim", "{0}") %>" class="img-responsive" />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <!-- Carousel nav -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                                href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                    <div id="slider-thumbs">
                        <!-- Bottom switcher of slider -->
                        <ul class="hide-bullets products-thumbs">
                            <asp:Repeater runat="server" DataSourceID="SDSResim">
                                <ItemTemplate>
                                    <li class="col-sm-3"><a class="thumbnail" id="carousel-selector-<%# Container.ItemIndex + 0 %>">
                                        <img src="<%# Eval("Resim", "{0}") %>" /></a> </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
            <!--/Slider-->
            <div class="col-md-6">
                <h2 class="product-name">
                    <asp:Literal runat="server" ID="LtrUrunAdi" Text='<%# Eval("UrunAd")%>'></asp:Literal></h2>
                 <h3 class="product-code" title="<%=GetGlobalResourceObject("default", "product_detail_product_code").ToString() %>"><%# Eval("UrunKodu")%></h3>
                <h4 class="product-price" runat="server" visible='<%# Eval("Fiyat") != DBNull.Value %>'>
                    <%# Eval("Fiyat","{0:N2}") %>
                    <%# Eval("Simge") %></h4>
                <hr />

               

                <p class="product-info">
                    <%# Eval("Bilgi") %>
                </p>
                <hr />
                <p>
                    <a class="btn btn-success btn-lg btn-color" href="#" data-toggle="modal" data-target="#siparis">
                        <i class="fa fa-shopping-cart"></i>&nbsp;<%=GetGlobalResourceObject("default", "siparis_ver_btn").ToString() %></a>
                </p>
                </button>
            </div>
        </div>
        <h4>
            <%=GetGlobalResourceObject("default", "product_detail_urun_ozellikleri_baslik").ToString() %></h4>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <%# GeleriEmbed(Eval("Detay"))%>
            </div>
        </div>
        <!-- Modal -->
    </ItemTemplate>
</asp:FormView>


<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Urun_Detay" SelectCommandType="StoredProcedure" OnSelected="SDS_Selected">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
        <asp:QueryStringParameter Name="UrunId" QueryStringField="urunid" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SDSResim" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="SELECT UrunId, Resim FROM snlg_V1.TblUrunResim WHERE (UrunId = @UrunId) ORDER BY Sira">
    <SelectParameters>
        <asp:QueryStringParameter Name="UrunId" QueryStringField="urunid" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<div id="siparis" class="modal fade" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">
                    <%=GetGlobalResourceObject("default", "siparis_form_title").ToString() %></h4>
            </div>
            <div class="modal-body">
                <div class="errors-out">
                    <div class="errors-in">
                    </div>
                </div>
                <div>
                    <asp:TextBox ID="txtUrunAdi" runat="Server" class="form-control" Enabled="false"></asp:TextBox>
                    <input name="SUrunAdet" id="SUrunAdet" placeholder="<%=GetGlobalResourceObject("default", "siparis_form_adet").ToString() %>"
                        type="number" class="form-control" required />
                    <input name="SAdSoyad" type="text" placeholder="<%=GetGlobalResourceObject("default", "siparis_form_adsoyad").ToString() %>"
                        class="form-control" required />
                    <input name="SEposta" type="email" placeholder="<%=GetGlobalResourceObject("default", "siparis_form_eposta").ToString() %>"
                        class="form-control" required />
                    <input name="STel" type="number"  placeholder="<%=GetGlobalResourceObject("default", "siparis_form_tel").ToString() %>"
                        class="form-control" required />
                    <input name="SAcikAdres" type="text" placeholder="<%=GetGlobalResourceObject("default", "siparis_form_adres").ToString() %>"
                        class="form-control" required />
                    <textarea name="SMesaj" placeholder="<%=GetGlobalResourceObject("default", "siparis_form_mesaj").ToString() %>"
                        class="form-control" rows="3"></textarea>
                        <input type="number" name="validText" placeholder="<%=GetGlobalResourceObject("default", "siparis_form_Dogrula").ToString() %>" class="form-control inputKeyControl" required />
                        <div class="form-group">
                            <img src="/ImageValidateHandler.ashx?g=150&y=40&u=4" alt="?" style="display: block; margin: 10px 0 0;" class="validImage" />
                        </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" name="Vazgec">
                    <%=GetGlobalResourceObject("default", "siparis_ascx_vazgec").ToString() %></button>
                <button type="submit" name="Gonder" id="load" class="btn btn-success" data-loading-text="<i class='fa fa-spinner fa-pulse'></i> Gönderiliyor...">
                    <%=GetGlobalResourceObject("default", "siparis_ascx_Gonder").ToString() %></button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("input[name=STel]").keypress(function (e) {
            if (e.keyCode > 31 && (e.keyCode < 40 || e.keyCode > 57))
                return false;
            return true;
        });
    });
    var isvalid_siparis_ascx = true;

    $(function () {
        $(window).on({
            keyup: function (event) {
                if (event.which == 13) {
                    $("#<%= UserControlClientID %> button[name=Gonder]").click();
                    $("#siparis").modal();
                }
            }
        });
    });

    $("#SUrunAdet").keyup(function () {
        if (this.value.match(/[^0-9]/g)) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
    });
    $('#<%= UserControlClientID %> [name=Gonder]').click(function (event) {

        Gonder_siparis_ascx(event);
        var $this = $(this);
        /*Button Loading*/
        if (isvalid_siparis_ascx) {
            $this.button('loading');
            setTimeout(function () {
                $this.button('reset');
            }, 5000);
        }
        else {
            $this.button('reset');
        }
    });

    function Gonder_siparis_ascx(event) {
        isvalid_siparis_ascx = true;
        $('#<%= UserControlClientID %> .ttErrorBox').remove();
        $('#<%= UserControlClientID %> .alert').remove();

        $('#<%= UserControlClientID %> input[required]').each(function () {
            if ($(this).val() == '') {
                $(this).after('<div class="ttErrorBox alert alert-danger require"><%=GetGlobalResourceObject("default", "login_ascx_hata03").ToString() %></div>');

                if (isvalid_siparis_ascx) {
                    $(this).focus();
                    isvalid_siparis_ascx = false;
                    $("#siparis").modal();

                }
            }
        });
        var value = document.getElementById('<%=txtUrunAdi.ClientID%>').value;
        if (isvalid_siparis_ascx) {
            $('#<%= UserControlClientID %>[name=Gonder]').addClass('AjaxLooder');
            $('#<%= UserControlClientID %> [name=Gonder]').attr('disabled', 'disabled');

            $.ajax({
                type: "POST",
                url: "/services/general.asmx/siparisGonder",
                data: '{"UrunAdi":"' + value.replace(/"/g, "\\\"") + '",\
                            "Adet":"' + $("#<%= UserControlClientID %> [name=SUrunAdet]").val().replace(/"/g, "\\\"") + '",\
                            "AdiSoyadi":"' + $("#<%= UserControlClientID %> [name=SAdSoyad]").val().replace(/"/g, "\\\"") + '" ,\
                            "Eposta":"' + $("#<%= UserControlClientID %> input[name=SEposta]").val().replace(/"/g, "\\\"") + '",\
                            "Tel":"' + $("#<%= UserControlClientID %> input[name=STel]").val().replace(/"/g, "\\\"") + '",\
                            "AcikAdres":"' + $("#<%= UserControlClientID %> input[name=SAcikAdres]").val().replace(/"/g, "\\\"") + '",\
                            "Mesaj":"' + $("#<%= UserControlClientID %> textarea[name=SMesaj]").val().replace(/"/g, "\\\"") + '",\
                            "validText":"' +  $("#<%= UserControlClientID %> input[name=validText]").val() + '" }',

                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var JSON = $.parseJSON(data.d);
                    $('#<%= UserControlClientID %> .errors-out').css('display', 'block');
                    $.each(JSON.mesajlar, function (i, mesaj) {
                        $('#<%= UserControlClientID %> .errors-in').append('<div class="' + mesaj.type + '">' + mesaj.mesaj + '</div>');
                    });
                },
                error: function () {
                    $('#<%= UserControlClientID %> .errors-in').append('<div class=\"alert alert-danger\"><%=GetGlobalResourceObject("default", "hataBeklenmeyen").ToString() %></div>');
                }
            }).done(function (html) {
                $("#<%= UserControlClientID %> .validImage").attr("src", "/ImageValidateHandler.ashx?g=150&y=40&u=4&" + (new Date()).getTime());
                $('#<%= UserControlClientID %> [name=Gonder]').removeAttr('disabled');
                $('#<%= UserControlClientID %>[name=Gonder]').removeClass('AjaxLooder');
            });

        }

        event.preventDefault();
    }
    function loginYonlendir() {
        //window.location.href = '/tr/uye-giris.aspx';
        return false;
    }

</script>
<%--ilk elemanın active olması--%>
<script type="text/javascript">
    jQuery(document).ready(function ($) {

        $('#myCarousel').carousel({
            interval: 5000
        });

        //Handles the carousel thumbnails
        $('[id^=carousel-selector-]').click(function () {
            var id_selector = $(this).attr("id");
            try {
                var id = /-(\d+)$/.exec(id_selector)[1];
                console.log(id_selector, id);
                jQuery('#myCarousel').carousel(parseInt(id));
            } catch (e) {
                console.log('Regex failed!', e);
            }
        });
        // When the carousel slides, auto update the text
        $('#myCarousel').on('slid.bs.carousel', function (e) {
            var id = $('.item.active').data('slide-number');
            $('#carousel-text').html($('#slide-content-' + id).html());
        });


        $('.carousel-inner .item:first').addClass('active');

    });
</script>
