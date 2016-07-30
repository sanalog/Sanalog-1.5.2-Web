<%@ Control Language="C#" AutoEventWireup="true" CodeFile="register.ascx.cs" Inherits="UserControls_uyelik_uyelik_formu" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>
<div class="errors-out">
    <div class="errors-in">
    </div>
</div>
<div class="form-wrap">

    <div class="form-group">
        <input type="email" name="TEposta" class="form-control" maxlength="150" placeholder="<%=GetGlobalResourceObject("default", "uyelik_ascx_eposta").ToString() %>" required autocomplete autofocus />
    </div>
    <div class="form-group">
        <input type="text" name="TUser" maxlength="25" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "uyelik_ascx_user").ToString() %>" required />
    </div>
    <div class="form-group">
        <input type="password" name="TSifre" maxlength="15" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "uyelik_ascx_sifre").ToString() %>" required />
    </div>
    <div class="form-group">
        <input type="text" name="TAd" maxlength="75" class="form-control" required placeholder="<%=GetGlobalResourceObject("default", "uyelik_ascx_isim").ToString() %>" />
    </div>
    <div class="form-group">
        <input type="number" name="validText" class="form-control" required placeholder="<%=GetGlobalResourceObject("default", "uyelik_ascx_Dogrula").ToString() %>" />
    </div>
    <div class="form-group">
        <img src="/ImageValidateHandler.ashx?g=150&y=40&u=4" alt="?" class="validImage" style="display: block; margin-top: 10px;" />
    </div>

</div>

<input type="button" class="btn btn-success" onclick="UyeKayit();" value="<%=GetGlobalResourceObject("default", "uyelik_ascx_kaydet").ToString() %>" />
<script type="text/javascript">
    $(function () {
        $(window).on({
            keyup: function (event) {
                if (event.which === 13) {
                    $("#<%= UserControlClientID %> input[type=button]").click();
                }
            }
        });
    });

    function UyeKayit() {
        $('#<%= UserControlClientID %> .ttErrorBox').remove();
        $('#<%= UserControlClientID %> .alert').remove();

        var TUser = $("#<%= UserControlClientID %> input[name=TUser]").val();
        var TEposta = $("#<%= UserControlClientID %> input[name=TEposta]").val();
        var TSifre = $("#<%= UserControlClientID %> input[name=TSifre]").val();
        var TAd = $("#<%= UserControlClientID %> input[name=TAd]").val();
        var validText = $("#<%= UserControlClientID %> input[name=validText]").val();

        if (TUser == "" || TEposta == "" || TSifre == "" || TAd == "" || validText == "") {

            $('#<%= UserControlClientID %> input[required], #<%= UserControlClientID %> textarea[required]').each(function () {
                if ($(this).val() == '') {
                    $(this).after('<div class="ttErrorBox alert alert-danger require"><%=GetGlobalResourceObject("default", "uyelik_ascx_hata03").ToString() %></div>');

                    if (isvalid_uyelik_ascx) {
                        $(this).focus();
                        isvalid_uyelik_ascx = false;
                    }
                }
            });
            return false;
        }
        else {
            if (IsEmail(TEposta) == false) {
                $("#<%= UserControlClientID %> input[name=TEposta]").after('<div class="ttErrorBox alert alert-danger require"><%=GetGlobalResourceObject("default", "makale_yorum_hata01").ToString() %></div>');
                 return false;
             }
             else {
                 $('#<%= UserControlClientID %> [type=button]').attr('disabled', 'disabled');
                 $('#<%= UserControlClientID %> [type=button]').addClass('AjaxLooder');

                 $.ajax({
                     type: "POST",
                     url: "/services/membership.asmx/UyeOl",
                     data: '{ "UserName":"' + $("#<%= UserControlClientID %> input[name=TUser]").val()
                                                + '","Eposta":"' + $("#<%= UserControlClientID %> input[name=TEposta]").val()
                                                + '","Sifre":"' + $("#<%= UserControlClientID %> input[name=TSifre]").val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"")
                                                + '","UyeAd":"' + $("#<%= UserControlClientID %> input[name=TAd]").val()
                                                + '","validText":"' + $("#<%= UserControlClientID %> input[name=validText]").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        var JSON = $.parseJSON(result.d);
                        $('#<%= UserControlClientID %> .errors-out').css('display', 'block');
                        $.each(JSON.mesajlar, function (i, mesaj) {
                            $('#<%= UserControlClientID %> .errors-in').append('<div class="' + mesaj.type + '">' + mesaj.mesaj + '</div>');
                        });
                    },
                    error: function () {
                        bootbox.alert(Error);
                    }
                }).done(function (html) {
                    $("#<%= UserControlClientID %>  .validImage").attr("src", "/ImageValidateHandler.ashx?g=150&y=40&u=4&" + (new Date()).getTime());
                    $('#<%= UserControlClientID %>  [type=button]').removeClass('AjaxLooder');
                    $('#<%= UserControlClientID %>  [type=button]').removeAttr('disabled');
                });

            }
        }
    }

    function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!regex.test(email)) {
            return false;
        } else {
            return true;
        }
    }



</script>
