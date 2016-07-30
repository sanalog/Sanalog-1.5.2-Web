<%@ Control Language="C#" AutoEventWireup="true" CodeFile="new-comment.ascx.cs" Inherits="modules_z_defteri_yorum_yaz" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik %>
</div>

<div class="addcomment" id="addcomment">

    <div class="errors-out">
        <div class="errors-in">
        </div>
    </div>
    <div class="form-wrap">
        <div class="form-group">
            <input type="text" name="TBYazan" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "zdefteri_yorumyaz_ascx_Yazan").ToString() %>" required maxlength="30" />
        </div>
        <div class="form-group">
            <input type="text" name="TBKonu" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "zdefteri_yorumyaz_ascx_Konu").ToString() %>" required maxlength="75" />
        </div>
        <div class="form-group">


            <textarea name="TBYorum" maxlength="1500" class="form-control" placeholder="<%=GetGlobalResourceObject("default", "zdefteri_yorumyaz_ascx_Mesaj").ToString() %>" span="TBYorumSay" required></textarea>
            <span class="label label-info" id="TBYorumSay"></span>
        </div>
        <div class="form-group">
            <input type="number" name="validText"  class="form-control" placeholder="<%=GetGlobalResourceObject("default", "zdefteri_yorumyaz_ascx_Dogrula").ToString() %>"  required />
        </div>
        <div class="form-group">
            <p class="mb-md mt-md">
                <img src="/ImageValidateHandler.ashx?g=150&y=40&u=4" alt="?" class="validImage" />
            </p>
        </div>

    </div>

    <input class="btn btn-success" type="button" value="<%=GetGlobalResourceObject("default", "zdefteri_yorumyaz_ascx_post").ToString() %>" />

</div>


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

    var isvalid_ziyaretci_yeni_yorum_ascx = true;

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


        $('#<%= UserControlClientID %> [type=button]').click(function (event) {
        ZDefteriYeniYorum(event);
    });


    function ZDefteriYeniYorum(event) {
        isvalid_ziyaretci_yeni_yorum_ascx = true;
        $('#<%= UserControlClientID %> .ttErrorBox').remove();
        $('#<%= UserControlClientID %> .alert').remove();

        $('#<%= UserControlClientID %> input[required], #<%= UserControlClientID %> textarea[required]').each(function () {
            if ($(this).val() == '') {
                $(this).after('<div class="ttErrorBox alert alert-danger required"><%=GetGlobalResourceObject("default", "zdefteri_yorumyaz_ascx_hata03").ToString() %></div>');

                if (isvalid_ziyaretci_yeni_yorum_ascx) {
                    $(this).focus();
                    isvalid_ziyaretci_yeni_yorum_ascx = false;
                }
            }
        });

        if (isvalid_ziyaretci_yeni_yorum_ascx) {
            $('#<%= UserControlClientID %> [type=button]').addClass('AjaxLooder');
            $('#<%= UserControlClientID %> [type=button]').attr('disabled', 'disabled');

            $.ajax({
                type: "POST",
                url: "/services/guestbook.asmx/YorumYaz", //web service ve methodumuz
                data: '{ "yazan":"' + $("#<%= UserControlClientID %> input[name=TBYazan]").val() + '","konu":"' + $("#<%= UserControlClientID %> input[name=TBKonu]").val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '","yorum":"' + $("#<%= UserControlClientID %> [name=TBYorum]").val().replace(/\\/g, "\\\\").replace(/"/g, "\\\"") + '","validText":"' + $("#<%= UserControlClientID %> input[name=validText]").val() + '" }',
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
                $('#<%= UserControlClientID %> [type=button]').removeClass('AjaxLooder');
                $('#<%= UserControlClientID %> [type=button]').removeAttr('disabled');
            });
        }

        event.preventDefault();
    }

</script>
