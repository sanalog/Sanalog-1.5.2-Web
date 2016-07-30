<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sponsor-form.ascx.cs" Inherits="modules_general_sponsor_form" %>
 <div class="errors-out">
        <div class="errors-in">
        </div>
    </div>


    <div class="form-wrap">
         <div class="form-group">
            <input type="text" name="TAd" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "sponsor_ascx_adsoyad").ToString() %>" maxlength="75" required />
        </div>
         <div class="form-group">

            <input type="number" name="TTel" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "sponsor_ascx_tel").ToString() %>" maxlength="20" />
        </div>

        <div class="form-group">
            <input type="email" name="TEposta" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "iletisim_ascx_eposta").ToString() %>" maxlength="250" required autocomplete autofocus />
        </div>
       <div class="form-group">
            <input type="text" name="TSirketAdi" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "sponsor_ascx_sirketAdi").ToString() %>" maxlength="75" required />
        </div>
        <div class="form-group">
            <input type="url" name="TSirketWeb" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "sponsor_ascx_sirketWeb").ToString() %>" maxlength="75" required />
        </div>
        <div class="form-group">
          <select data-placeholder="Sponsorluk Paketi *" id="send-form-select" name="TSponsorPaket" required="required" style="display: none;">
            <option value=""></option>
            <option value="Platin">Platin</option>
            <option value="Gümüş">G&uuml;m&uuml;ş</option>
            <option value="Topluluk">Topluluk</option>
          </select>
       </div>
        <div class="form-group">
            <textarea name="TMesaj" maxlength="100000" placeholder="<%=GetGlobalResourceObject("default", "sponsor_ascx_mesaj").ToString() %>" class="form-control" span="TMesajSay"></textarea>
            <span class="label label-info" id="TMesajSay"></span>
        </div>
       
    </div>

<button type="submit" class="btn btn-default" id="load"  data-loading-text="<i class='fa fa-spinner fa-pulse'></i> Gönderiliyor..."><%=GetGlobalResourceObject("default", "sponsor_ascx_gonder").ToString() %></button>

<script type="text/javascript">

    $(document).ready(function () {
        $("input[name=TTel]").keypress(function (e) {
            if (e.keyCode > 31 && (e.keyCode < 40 || e.keyCode > 57))
                return false;
            return true;
        });
    });

     $(function () {
        $(window).on({
            keyup: function (event) {
                if (event.which == 13) {
                    $("#<%= UserControlClientID %> button[type=submit]").click();
                }
            }
        });
     });

    var isvalid_iletisim_ascx = true;

    $('#<%= UserControlClientID %> textarea[maxlength]')
    .keyup(function (e) {
        var limit = $(this).attr('maxlength');
        if ($(this).val().length >= limit) {
            if (e.keyCode != 8 && e.keyCode != 46)
                e.preventDefault();
            $(this).val($(this).val().substring(0, limit));
        }
        $('#<%= UserControlClientID %> #' + $(this).attr('span')).text(limit - $(this).val().length);
    })
        .keydown(function (e) {
            var limit = $(this).attr('maxlength');
            if ($(this).val().length >= limit) {
                if (e.keyCode != 8 && e.keyCode != 46)
                    e.preventDefault();
                $(this).val($(this).val().substring(0, limit));
            }
            $('#<%= UserControlClientID %> #' + $(this).attr('span')).text(limit - $(this).val().length);
        });

    $('#<%= UserControlClientID %> [type=submit]').click(function (event) {
        Gonder_iletisim_ascx(event);

        var $this = $(this);
        /*Button Loading*/
        if (isvalid_iletisim_ascx) {
            $this.button('loading');
            setTimeout(function () {
                $this.button('reset');
            }, 5000);
        }
        else {
            $this.button('reset');
        }
    });

    function Gonder_iletisim_ascx(event) {
        isvalid_iletisim_ascx = true;
        $('#<%= UserControlClientID %> .ttErrorBox').remove();
        $('#<%= UserControlClientID %> .errors-in > div').remove('');
        $('#<%= UserControlClientID %> [type=button]').attr('disabled', 'disabled');

        $('#<%= UserControlClientID %> input[required], #<%= UserControlClientID %> textarea[required]').each(function () {
            if ($(this).val() == '') {
                $(this).after('<div class="ttErrorBox alert alert-danger require"><%=GetGlobalResourceObject("default", "iletisim_ascx_hata03").ToString() %></div>');

                if (isvalid_iletisim_ascx) {
                    $(this).focus();
                    isvalid_iletisim_ascx = false;
                }
            }
        });

        if (isvalid_iletisim_ascx) {
            $('#<%= UserControlClientID %> input[type=email]').each(function () {
                if ($(this).val() == '')
                    return;

                var pattern = /([a-zA-Z][-._a-zA-Z0-9]*[a-zA-Z0-9]@\w[-._\w]*\w\.\w{2,3})/;
                if (!pattern.test($(this).val())) {
                    $(this).after('<div class="ttErrorBox alert alert-danger wrong"><%=GetGlobalResourceObject("default", "iletisim_ascx_hata06").ToString() %></div>');

                    if (isvalid_iletisim_ascx) {
                        $(this).focus();
                        isvalid_iletisim_ascx = false;
                    }
                }
            });
        }

        if (isvalid_iletisim_ascx) {
            $('#<%= UserControlClientID %> input[type=tel], #<%= UserControlClientID %> input[type=number]').each(function () {
                if ($(this).val() == '')
                    return;

                var pattern = /^\d+$/;
                if (!pattern.test($(this).val())) {
                    $(this).after('<div class="ttErrorBox alert alert-danger wrong"><%=GetGlobalResourceObject("default", "iletisim_ascx_hata02").ToString() %></div>');

                    if (isvalid_iletisim_ascx) {
                        $(this).focus();
                        isvalid_iletisim_ascx = false;
                    }
                }
            });
        }

        if (isvalid_iletisim_ascx) {
            $.ajax({
                type: "POST",
                url: "/services/general.asmx/sponsorBasvuruFormuGonder", //web service ve methodumuz
                data: '{"Eposta":"' + $("#<%= UserControlClientID %> input[name=TEposta]").val()
                    + '","Mesaj":"' + $("#<%= UserControlClientID %> [name=TMesaj]").val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"")
                    + '" ,"UyeAd":"' + $("#<%= UserControlClientID %> input[name=TAd]").val()
                    + '","SirketAdi":"' + $("#<%= UserControlClientID %> input[name=TSirketAdi]").val()
                    + '","SirketWeb":"' + $("#<%= UserControlClientID %> input[name=TSirketWeb]").val()
                    + '","Tel":"' + $("#<%= UserControlClientID %> input[name=TTel]").val()
                    + '","SponsorPaket":"' + $("#<%= UserControlClientID %> select[name=TSponsorPaket]").val() + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var JSON = $.parseJSON(data.d);
                    $('#<%= UserControlClientID %> .errors-out').css('display', 'block');
                    $.each(JSON.mesajlar, function (i, mesaj) {
                        $('#<%= UserControlClientID %> .errors-in').append('<div class=\"' + mesaj.type + '\">' + mesaj.mesaj + '</div>');
                    });

                },
                error: function () {
                    $('#<%= UserControlClientID %> .errors-in').append('<div class=\"hatali\"><%=GetGlobalResourceObject("default", "hataBeklenmeyen").ToString() %></div>');
                }
            }).done(function (html) {
                $("#<%= UserControlClientID %> .validImage").attr("src", "/ImageValidateHandler.ashx?g=150&y=40&u=4&" + (new Date()).getTime());
            });

            
        }

        $('#<%= UserControlClientID %> [type=submit]').removeAttr('disabled');
        $('#<%= UserControlClientID %> .ttErrorBox alert alert-danger').click(function () {
            $(this).remove();
        });
        event.preventDefault();

    }
</script>