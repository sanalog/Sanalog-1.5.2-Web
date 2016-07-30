<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="loginAdmn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="bootstrap-admin-vertical-centered">
<head runat="server">
    <title><%= Resources.admin_language.login_admin_header %></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="ROBOTS" content="NOINDEX, NOFOLLOW" />

    <!-- stylesheets -->
    <asp:Literal ID="LtrHead" runat="server"></asp:Literal>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <!-- FONTS -->
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css' />

    <asp:Literal ID="LtrVers" runat="server" />
</head>
<body class="bootstrap-admin-without-padding">

    <div class="container">
        <div class="row">
            <form id="form1" runat="server">
                <div class="col-lg-12">
                    <div class="panel bootstrap-admin-login-form">
                        <div class="panel-heading">
                            <h1>
                                <img src="<%= Snlg_ConfigValues.AdminThemePath %>images/sanalog-icon.png" alt="" class="login-logo-ico" title="Sanalog v1.0 Admin" /><%= Resources.admin_language.login_admin_title %> <small><%= Resources.admin_language.login_admin_title_small %></small>
                            </h1>
                        </div>
                        <div class="panel-body" id="divLogin">
                            <div class="errors-out">
                                <div class="errors-in">
                                </div>
                            </div>


                            <div class="form-group">
                                <asp:TextBox ID="TBUser" runat="server" class="form-control" placeholder="<%$ Resources:admin_language, login_admin_username %>" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="TBUser" CssClass="hata"
                                    Display="Dynamic" ErrorMessage="*" ValidationGroup="login" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="TBSifre" runat="server" class="form-control" TextMode="Password" EnableViewState="False" placeholder="<%$ Resources:admin_language, login_admin_pass %>" />
                            </div>
                            <asp:Literal runat="server" ID="LtrHata"></asp:Literal>

                            <asp:Button ID="BtnLogin" Text="<%$ Resources:admin_language, login_admin_input %>" class="btn btn-info" runat="server" OnClick="BtnLogin_Click" ValidationGroup="login" />
                            <input type="button" class="btn btn-info"
                                value="<%= Resources.admin_language.login_admin_forgot_pass %>" data-toggle="modal" data-target="#modalLogin_ascx_lb" />

                        </div>
                    </div>
                </div>


                <div id="modalLogin_ascx_lb" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="ButtonKapat" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="H1"><%= Resources.admin_language.login_admin_forgot_pass %></h4>
                            </div>
                            <div class="modal-body psw modal-forgot">
                                <div class="errors-out">
                                    <div class="errors-in">
                                    </div>
                                </div>
                                <div class="form-wrap">
                                    <div class="form-group">
                                        <input type="email" name="TEposta" placeholder="<%= Resources.admin_language.e_post  %>" maxlength="150" autocomplete autofocus class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="validText" placeholder="<%= Resources.admin_language.verification_code %>" class="form-control" />
                                    </div>
                                    <img src="/ImageValidateHandler.ashx?g=150&y=40&u=4" alt="?" class="validImage" />
                                </div>


                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-info" id="load" data-loading-text="<i class='fa fa-spinner fa-pulse'></i> <%= Resources.admin_language.sending %>"><%= Resources.admin_language.login_admin_sent_pass %></button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="navbar navbar-footer navbar-fixed-bottom" style="position: fixed !important;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <footer role="contentinfo">
                            <div class="pull-left"><p><%= Resources.admin_language.login_admin_footer_1 %>
                <%= DateTime.Today.Year.ToString() %> <%= Resources.admin_language.login_admin_footer_2 %></p></div>
                        </footer>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="<%= Snlg_ConfigValues.AdminThemePath %>js/bootstrap.min.js"></script>

</body>
<script type="text/javascript">
    $('#<%= TBUser.ClientID %>').focus();
    var isvalid_login_ascx = true;

    $('#forgetBtn').click(function (event) {
        $('#modalLogin_ascx_lb').modal();
    });

    $('#modalLogin_ascx_lb [type=button]').click(function (event) {
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

    $('.errors-in > div').on('click', function () {
        $(this).remove();
        if ($('.errors-in > div').length < 1)
            $('.errors-out').css('display', 'none');
    });

    function SifreSifirla_login_ascx(event) {
        isvalid_login_ascx = true;
        $('.errors-in').empty();
        $('#modalLogin_ascx_lb .ttErrorBox').remove();

        $('#modalLogin_ascx_lb input').each(function () {
            if ($(this).val() == '') {
                if (isvalid_login_ascx) {
                    $('#modalLogin_ascx_lb .errors-in').append('<div class=\"ttErrorBox alert alert-danger\"><%= Resources.admin_language.login_ful_fill %></div>');
                    $(this).focus();
                    isvalid_login_ascx = false;
                }
            }
        });

        if (isvalid_login_ascx) {
            $('#modalLogin_ascx_lb [name=TEposta]').each(function () {
                if ($(this).val() == '')
                    return;

                var pattern = /([a-zA-Z][-._a-zA-Z0-9]*[a-zA-Z0-9]@\w[-._\w]*\w\.\w{2,3})/;
                if (!pattern.test($(this).val())) {
                    $('#modalLogin_ascx_lb .errors-in').append('<div class=\"ttErrorBox alert alert-danger\"><%= Resources.admin_language.login_eposta_wrong %></div>');

                    if (isvalid_login_ascx) {
                        $(this).focus();
                        isvalid_login_ascx = false;
                    }
                }
            });
        }

        if (isvalid_login_ascx) {
            $('#modalLogin_ascx_lb [type=button]').attr('disabled', 'disabled');

            $.ajax({
                type: "POST",
                url: "/services/membership.asmx/SifreSifirlama", //web service ve methodumuz
                data: '{ "Eposta":"' + $("#modalLogin_ascx_lb [name=TEposta]").val() + '","validText":"' + $("#modalLogin_ascx_lb [name=validText]").val() + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var JSON = $.parseJSON(data.d);
                    $('#modalLogin_ascx_lb .errors-out').css('display', 'block');
                    $.each(JSON.mesajlar, function (i, mesaj) {
                        $('#modalLogin_ascx_lb .errors-in').append('<div class=\"' + mesaj.type + '\">' + mesaj.mesaj + '</div>');
                    });
                },
                error: function () {
                    $('#modalLogin_ascx_lb .errors-in').append('<div class=\"ttErrorBox alert alert-danger\"><%= Resources.admin_language.eror_unexcepted %></div>');
                }
            }).done(function (html) {
                $('#modalLogin_ascx_lb [type=button]').removeAttr('disabled');
            });
        }

        event.preventDefault();
    }

    $('#modalLogin_ascx_lb input').keypress(function (e) {
        if (e.keyCode == 13)
            e.preventDefault();
    });


</script>
</html>
