<%@ Control Language="C#" AutoEventWireup="true" CodeFile="comments.ascx.cs" Inherits="modules_makale_yorumlar" %>

<input type="hidden" name="hdnUst" value="" />

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>><%= this.baslik %> (<asp:Label runat="server" ID="LblYorumSayisi"></asp:Label>)</div>
<div id="comments" class="comments">

    <div class="DivMakYorumlar">
    </div>

</div>

<asp:Literal ID="LtrSayfalama" runat="server" />

<hr />
<%--yorum yazma formu (modal)--%>

<div id="modalYorumYaz" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><%=GetGlobalResourceObject("default", "makale_yorum_cevap_modal_title").ToString() %></h4>
            </div>
            <div class="modal-body">
                <div class="form-wrap" id="yorumlar_ascx_DivCevapYaz">
                    <div class="form-gorup">
                        <div class="errors-out">
                            <div class="errors-in">
                            </div>
                        </div>


                        <div class="rating">
                            <div id="oyla">
                            </div>
                            <p>
                                <input type="hidden" name="rating" value="5" />
                                <script type="text/javascript">
                                    $(document).ready(function () {
                                        $('#<%= UserControlClientID %> .rating #oyla').raty({
                                            path: '/scripts/jquery.raty-2.4.5/img/', number: 5, score: 5, starOn: 'star-on.png', starOff: 'star-off.png',
                                            click: function (score, evt) { $('#<%= UserControlClientID %> .rating input[name=rating]').val(score); }
                                        });
                                    });
                                </script>
                            </p>
                        </div>




                        <div class="form-wrap">
                            <div class="form-group">

                                <input type="text" name="TYazan" class="form-control" required maxlength="30" placeholder="<%=GetGlobalResourceObject("default", "yorumlar_ascx_Yazan").ToString() %>" value="<%= Snlg_MemberInfo.s_UserName %>" />

                            </div>
                            <div class="form-group">


                                <input type="email" name="TEposta" class="form-control" maxlength="150" placeholder="<%=GetGlobalResourceObject("default", "yorumlar_ascx_Eposta").ToString() %>" required autocomplete value="<%= eposta.ToString() %>" />

                            </div>
                            <div class="form-group">

                                <textarea name="TBYorum" maxlength="10000" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "yorumlar_ascx_Yorum").ToString() %>" span="TBYorumSay" required></textarea>
                            </div>
                            <div class="form-group">
                                <span class="label label-info" id="TBYorumSay"></span>
                            </div>
                            <div class="form-group">

                                <input type="number" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "yeni_yorum_yaz_ascx_Dogrula").ToString() %>" name="validText" required />
                            </div>

                            <div class="form-group">
                                <img src="/ImageValidateHandler.ashx?g=150&y=40&u=4" alt="?" class="validImage" />
                            </div>

                        </div>


                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-right">
                    <input type="button" class="btn btn-success" value="<%=GetGlobalResourceObject("default", "yorumlar_ascx_Post").ToString() %>" />

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var isvalid_yorumlar_ascx = true;
    $('#<%= UserControlClientID %> [name=hdnUst]').val("-1");

    MakYorumlariGetir(1);
    //yorumların sayfalama linkleri ayarlanıyor
    $('#<%= UserControlClientID %> .pager a').attr('href', '#');
    $('#<%= UserControlClientID %> .pager a:first').addClass('current');
    $('#<%= UserControlClientID %> .pager a').click(function (event) {
        MakYorumlariGetir($(this).text());
        $('#<%= UserControlClientID %> .pager a').removeClass('current');
        $(this).addClass('current');
        event.preventDefault();
    });

    $('#<%= UserControlClientID %> textarea[maxlength]').keyup(function (e) {
        var limit = $(this).attr('maxlength');
        if ($(this).val().length >= limit) {
            if (e.keyCode != 8 && e.keyCode != 46)
                e.preventDefault();
            $(this).val($(this).val().substring(0, limit));
        }
        $('#<%= UserControlClientID %> #' + $(this).attr('span')).text(limit - $(this).val().length);
    }).keydown(function (e) {
        var limit = $(this).attr('maxlength');
        if ($(this).val().length >= limit) {
            if (e.keyCode != 8 && e.keyCode != 46)
                e.preventDefault();
            $(this).val($(this).val().substring(0, limit));
        }
        $('#<%= UserControlClientID %> #' + $(this).attr('span')).text(limit - $(this).val().length);
    });

    if ("<%= Snlg_MemberInfo.s_UserId %>") {
        $("#<%= UserControlClientID %> input[name=TBYazan], #<%= UserControlClientID %> input[name=TEposta]").keydown(function (e) {
            e.preventDefault();
        });
    }

    $('#<%= UserControlClientID %> [type=button]').click(function (event) {
        MakYorumCevap(event);
    });

    function MakYorumlariGetir(currentPage) {
        $.ajax({
            type: "POST",
            url: "/services/article.asmx/Yorumlar", //web service ve methodumuz
            data: '{ "currentPage":' + currentPage + ',"makid":<%= Request.QueryString["makid"] %>,"PageSize":<%= this.PageSize %>}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#<%= UserControlClientID %> .DivMakYorumlar').empty();
                $('#<%= UserControlClientID %> .DivMakYorumlar').append(data.d);
            },
            error: function () {
            }
        }).done(function (html) {
            $('#<%= UserControlClientID %> .DivMakYorumlar [data-comment-id]').click(function () {
                $("#<%= UserControlClientID %> #modalYorumYaz").modal();
                $('#<%= UserControlClientID %> [name=hdnUst]').val($(this).attr('data-comment-id'));
            });
        });
    }

    function MakYorumCevap(event) {
        isvalid_yorumlar_ascx = true;
        $('#<%= UserControlClientID %> .ttErrorBox').remove();
        $('#<%= UserControlClientID %> .alert').remove();

        $('#<%= UserControlClientID %> input[required], #<%= UserControlClientID %> textarea[required]').each(function () {
            if ($(this).val() == '') {
                $(this).after('<div class=\"ttErrorBox required alert alert-danger\"><%=GetGlobalResourceObject("default", "makale_asmx_hata03").ToString() %></div>');

                if (isvalid_yorumlar_ascx) {
                    $(this).focus();
                    isvalid_yorumlar_ascx = false;
                }
            }
        });

        if (isvalid_yorumlar_ascx) {
            $('#<%= UserControlClientID %> input[type=email]').each(function () {
                if ($(this).val() == '')
                    return;

                var pattern = /([a-zA-Z][-._a-zA-Z0-9]*[a-zA-Z0-9]@\w[-._\w]*\w\.\w{2,3})/;
                if (!pattern.test($(this).val())) {
                    $(this).after('<div class="ttErrorBox alert alert-danger"><%=GetGlobalResourceObject("default", "makale_yorum_hata01").ToString() %></div>');

                    if (isvalid_yorumlar_ascx) {
                        $(this).focus();
                        isvalid_yorumlar_ascx = false;
                    }
                }
            });
        }

        if (isvalid_yorumlar_ascx) {
            $('#<%= UserControlClientID %> [type=button]').attr('disabled', 'disabled');
            $('#<%= UserControlClientID %> [type=button]').addClass('AjaxLooder');

            $.ajax({
                type: "POST",
                url: "/services/article.asmx/YorumYaz", //web service ve methodumuz
                data: '{ "yazan":"' + $("#<%= UserControlClientID %> input[name=TBYazan]").val() + '","eposta":"' + $("#<%= UserControlClientID %> input[name=TEposta]").val() + '","yorum":"' + $("#<%= UserControlClientID %> [name=TBYorum]").val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '","puan":"' + $("#<%= UserControlClientID %> .rating input[name=rating]").val() + '","ustYId":"' + $('#<%= UserControlClientID %> [name=hdnUst]').val() + '","makid":"<%= Request.QueryString["makid"] %>","validText":"' + $("#<%= UserControlClientID %> input[name=validText]").val() + '"}',
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
                    $('#<%= UserControlClientID %> .errors-in').append('<div class=\"alert alert-danger\"><%=GetGlobalResourceObject("default", "hataBeklenmeyen").ToString() %></div>');
                }
            }).done(function (html) {
                $("#<%= UserControlClientID %> .validImage").attr("src", "/ImageValidateHandler.ashx?g=150&y=40&u=4&" + (new Date()).getTime());
                $('#<%= UserControlClientID %> [type=button]').removeClass('AjaxLooder');
                $('#<%= UserControlClientID %> [type=button]').removeAttr('disabled');
            });
        }

        event.preventDefault();
    }
</script>
