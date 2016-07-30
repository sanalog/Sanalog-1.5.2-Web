<%@ Control Language="C#" AutoEventWireup="true" CodeFile="polls.ascx.cs"
    Inherits="modules_anket_anketler_blok" %>

<div class="module-title" <%= (this.baslikGorunsun ? "" : "style='display: none;'") %>>
    <%= this.baslik%>
</div>


<div class="errors-out">
    <div class="errors-in">
    </div>
</div>


<asp:Repeater runat="server" DataSourceID="SDS">
    <ItemTemplate>
        <h6 class="soru">
            <%# Eval("soru")%>
        </h6>
        <ul class="secenekler" rel="<%# Eval("AnketId", "anket_ascx{0}") %>">
            <li class="secenek">
                <input type="radio" value="A" runat="server" />
                <%# Eval("A") %>
            </li>
            <li class="secenek">
                <input type="radio" value="B" runat="server" />
                <%# Eval("B") %>
            </li>
            <li class="secenek">
                <input type="radio" value="C" runat="server" visible='<%# !string.IsNullOrEmpty(Eval("C").ToString()) %>' />
                <%# Eval("C") %>
            </li>
            <li class="secenek">
                <input type="radio" value="D" runat="server" visible='<%# !string.IsNullOrEmpty(Eval("D").ToString()) %>' />
                <%# Eval("D") %>
            </li>
            <li class="secenek">
                <input type="radio" value="E" runat="server" visible='<%# !string.IsNullOrEmpty(Eval("E").ToString()) %>' />
                <%# Eval("E") %>
            </li>
            <li class="secenek">
                <input type="radio" value="F" runat="server" visible='<%# !string.IsNullOrEmpty(Eval("F").ToString()) %>' />
                <%# Eval("F") %>
            </li>
            <li class="secenek">
                <input type="radio" value="G" runat="server" visible='<%# !string.IsNullOrEmpty(Eval("G").ToString()) %>' />
                <%# Eval("G") %>
            </li>
            <li class="secenek">
                <input type="radio" value="H" runat="server" visible='<%# !string.IsNullOrEmpty(Eval("H").ToString()) %>' />
                <%# Eval("H") %>
            </li>
        </ul>
        <a class="btn btn-default btn-sm" href="#AnketAscxSonucDiv" onclick="AjaxAnketSonucGetir(<%# Eval("AnketId") %>, '<%# Eval("OyKulandi") %>');" style="<%# Convert.ToBoolean(Eval("SonucGoster")) ? "": "display:none;" %>"><%=GetGlobalResourceObject("default", "anketler_ascx_oylama").ToString() %></a>
    </ItemTemplate>
</asp:Repeater>
<hr />


<div id="modalAnketAscxSonucDiv" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Anket Sonucu</h4>
            </div>
            <div class="modal-body" style="overflow: hidden;">
                <div id="AnketAscxSonucDiv"></div>
            </div>

        </div>
    </div>
</div>


<asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
    SelectCommand="snlg_V1.zsp_Anketler" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="false"
    OnSelected="SDS_Selected" OnSelecting="SDS_Selecting">
    <SelectParameters>
        <asp:SessionParameter Name="Dil" SessionField="ZDilId" Type="Int16" />
        <asp:SessionParameter Name="UserId" Type="Int32" SessionField="UserId" />
        <asp:Parameter Name="IP" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    var isvalid_anket_ascx = true;

    google.load('visualization', '1.0', { 'packages': ['corechart'] });

    $('#<%= UserControlClientID %> [type=radio]').click(function (event) {
        AnketOylamaGonder(event, $(this).val(), $(this).closest('ul.secenekler').attr('rel').replace("anket_ascx", ""));
    });

    function AnketOylamaGonder(event, secim, anket) {
        isvalid_anket_ascx = true;
        $('#<%= UserControlClientID %> .ttErrorBox').remove();
        $('#<%= UserControlClientID %> .alert').remove();

        if (isvalid_anket_ascx) {
            $('#<%= UserControlClientID %> [type=radio]').attr('disabled', 'disabled');

            $.ajax({
                type: "POST",
                url: "/services/poll.asmx/OylamaGonder", //web service ve methodumuz
                data: '{ "AnketId":' + anket + ',"Cevap":"' + secim + '" }',
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
                $('#<%= UserControlClientID %> [type=radio]').removeAttr('disabled');
            });
        }

        event.preventDefault();
    }

    function AjaxAnketSonucGetir(AnketId, oyKullandi) {
        $("#AnketAscxSonucDiv").empty();
        if (oyKullandi != "") {
            bootbox.alert('Sonuçları görmek için oy kullanmalısınız.');
            return;
        }

        $.ajax({
            type: "POST",
            url: "/services/poll.asmx/AnketSonucuGetir",
            data: '{ "AnketId":' + AnketId + ' }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (sonuc) {
                var anket_ascx_oylar = $.parseJSON(sonuc.d);
                var anket_ascx_data;
                var anket_ascx_chart;
                var anket_ascx_soru;
                anket_ascx_data = new google.visualization.DataTable();
                anket_ascx_data.addColumn('string', 'Secenek');
                anket_ascx_data.addColumn('number', 'Oy');
                $.each(anket_ascx_oylar, function (i, anket) {
                    anket_ascx_soru = i;
                    $.each(anket_ascx_oylar[i], function (n, secenek) {
                        $.each(secenek, function (key, value) {
                            anket_ascx_data.addRows([[key, value]]);
                        });
                    });
                });
                var options = { 'title': anket_ascx_soru, 'width': 600, 'height': 450, 'is3D': true };
                anket_ascx_chart = new google.visualization.PieChart(document.getElementById('AnketAscxSonucDiv'));
                anket_ascx_chart.draw(anket_ascx_data, options);
                $("#modalAnketAscxSonucDiv").modal();
            },
            error: function () {
                bootbox.alert('Beklenmeyen bir hata oluştu');

            }
        });
    }
</script>
