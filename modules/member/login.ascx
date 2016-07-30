<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login.ascx.cs" Inherits="modules_uyelik_login" %>

<%--<div rel="<%= UserControlClientID %>">    </div>--%>
<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>

<div class="errors-out">
    <div class="errors-in">
    </div>
</div>

<asp:Literal runat="server" ID="LtrHata"></asp:Literal>

<div class="form-wrap">
    <div class="form-group">
        <input id="TLogUser" type="text" name="TLogUser" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "login_ascx_user").ToString() %>" maxlength="250" required />

    </div>
    <div class="form-group">
        <input type="password" name="TLogSifre" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "login_ascx_sifre").ToString() %>" required />
    </div>
    <div>
        <span></span>
    </div>


</div>


<asp:Button ID="BtnLogin" CssClass="btn btn-success" Text="<%$ Resources:default, login_ascx_submit %>" runat="server"
    OnClick="BtnLogin_Click" />
<input type="button" id="BtnSifreUnuutm" class="btn btn-info" value="<%=GetGlobalResourceObject("default", "login_ascx_sifre_unuttum").ToString() %>" />


<hr />

<div id="modalLogin_ascx_lb" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Şifremi Unuttum</h4>
            </div>
            <div class="modal-body psw">
                <div class="errors-out">
                    <div class="errors-in">
                    </div>
                </div>

                <div class="form-wrap">
                    <div class="form-group">
                        <input type="email" name="TEposta" class="form-control"
                            placeholder="<%=GetGlobalResourceObject("default", "login_ascx_eposta").ToString() %>"
                            maxlength="150" autocomplete autofocus required />
                    </div>
                    <div class="form-group">
                        <input type="number" name="validText" class="form-control" required
                            placeholder="<%=GetGlobalResourceObject("default", "login_ascx_dogrula").ToString() %>" />
                    </div>
                    <img src="/ImageValidateHandler.ashx?g=150&y=40&u=4" alt="?" class="validImage" />
                </div>



            </div>
            <div class="modal-footer">
                <div class="pull-left">
                    <button type="button" class="btn btn-success" id="btnPswGonder" data-loading-text="<i class='fa fa-spinner fa-pulse'></i> Gönderiliyor..."><%=GetGlobalResourceObject("default", "login_ascx_submit2").ToString() %></button>
                    <%--  <input type="button" class="btn btn-default btn-sm sifreUnuttum" value="" />--%>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $(window).on({
            keyup: function (event) {
                if (event.which === 13) {
                    $("#<%= BtnLogin.ClientID %>").click();
                }
            }
        });
    });

    var isvalid_login_ascx = true;

    $('#<%= UserControlClientID %> #BtnSifreUnuutm').click(function (event) {
        $("#modalLogin_ascx_lb").modal();
    });



    $('#<%= UserControlClientID %> #btnPswGonder').click(function (event) {
        SifreSifirla_login_ascx(event);
        var $this = $(this);
        /*Button Loading*/
        if (isvalid_login_ascx) {
            $this.button('loading');
            setTimeout(function () {
                $this.button('reset');
            }, 5000);
        }
        else {
            $this.button('reset');
        }
    });

    function SifreSifirla_login_ascx(event) {
        isvalid_login_ascx = true;
        $('#<%= UserControlClientID %> .ttErrorBox').remove();
        $('#<%= UserControlClientID %> .alert').remove();

        $('#<%= UserControlClientID %> .psw input[required], #<%= UserControlClientID %> .psw textarea[required]').each(function () {
            if ($(this).val() == '') {
                $(this).after('<div class="ttErrorBox alert alert-danger"><%=GetGlobalResourceObject("default", "login_ascx_hata03").ToString() %></div>');

                if (isvalid_login_ascx) {
                    $(this).focus();
                    isvalid_login_ascx = false;
                }
            }
        });
        if (isvalid_login_ascx) {
            $('#<%= UserControlClientID %> .psw input[type=email]').each(function () {
                if ($(this).val() == '')
                    return;

                var pattern = /([a-zA-Z][-._a-zA-Z0-9]*[a-zA-Z0-9]@\w[-._\w]*\w\.\w{2,3})/;
                if (!pattern.test($(this).val())) {
                    $(this).after('<div class="ttErrorBox alert alert-danger"><%=GetGlobalResourceObject("default", "login_ascx_hata06").ToString() %></div>');

                    if (isvalid_login_ascx) {
                        $(this).focus();
                        isvalid_login_ascx = false;
                    }
                }
            });
        }

        if (isvalid_login_ascx) {
            $('#<%= UserControlClientID %> [type=button]').attr('disabled', 'disabled');
            $('#<%= UserControlClientID %> [type=button]').addClass('AjaxLooder');

            $.ajax({
                type: "POST",
                url: "/services/membership.asmx/SifreSifirlama", //web service ve methodumuz
                data: '{ "Eposta":"' + $("#<%= UserControlClientID %> .psw input[name=TEposta]").val() + '","validText":"' + $("#<%= UserControlClientID %> .psw input[name=validText]").val() + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var JSON = $.parseJSON(data.d);
                    $('#<%= UserControlClientID %> .psw .errors-out').css('display', 'block');
                    $.each(JSON.mesajlar, function (i, mesaj) {
                        $('#<%= UserControlClientID %> .psw .errors-in').append('<div class=\"' + mesaj.type + '\">' + mesaj.mesaj + '</div>');
                    });

                },
                error: function () {
                    $('#<%= UserControlClientID %> .psw .errors-in').append('<div class=\"alert alert-danger\"><%=GetGlobalResourceObject("default", "hataBeklenmeyen").ToString() %></div>');
                }
            }).done(function (html) {
                $("#<%= UserControlClientID %>  .validImage").attr("src", "/ImageValidateHandler.ashx?g=150&y=40&u=4&" + (new Date()).getTime());
                $('#<%= UserControlClientID %>  [type=button]').removeClass('AjaxLooder');
                $('#<%= UserControlClientID %>  [type=button]').removeAttr('disabled');
            });

        }


        event.preventDefault();
    }

    function loginol_login_ascx(event) {
        isvalid_login_ascx = true;
        $('#<%= UserControlClientID %> .ttErrorBox').remove();
        $('#<%= UserControlClientID %> .errors-in > div').remove('');

        $('#<%= UserControlClientID %> input[required]').each(function () {
            if ($(this).val() == '') {
                $(this).after('<div class="ttErrorBox alert alert-danger"><%=GetGlobalResourceObject("default", "login_ascx_hata03").ToString() %></div>');

                if (isvalid_login_ascx) {
                    $(this).focus();
                    isvalid_login_ascx = false;
                }
            }
        });

        if (!isvalid_login_ascx) {
            event.preventDefault();
        }
    }
</script>
