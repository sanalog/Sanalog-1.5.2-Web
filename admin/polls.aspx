<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="polls.aspx.cs" Inherits="admin_anketler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load('visualization', '1.0', { 'packages': ['corechart'] });

        $(document).ready(function () {

                        $('body').on("click", ".table tr", function (e) {
                if (e.target.tagName == "TD") {
                    $("input[rel=Sec]").prop('checked', false);
                    $(this).closest('tr').find('input[rel=Sec]').prop('checked', 'checked');
                    $('.icon_duzenle').click();
                }
            });

            $('body').on("click", ".icon_sil", function () {
                if ($('input[rel=Sec]:checked').length < 1) {
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                    return;
                }

                bootbox.confirm("Silmek istediğinizden emin misiniz?", function (result) {
                    if (result != true)
                        return;

                    $('[name=HdnSil]').val('');
                    $('input[rel=Sec]:checked').each(function () {
                        $('[name=HdnSil]').val($('[name=HdnSil]').val() + $(this).val() + ',');
                    });
                    $('[name=HdnSil]').val($('[name=HdnSil]').val().substring(0, $('[name=HdnSil]').val().length - 1));
                    $('form').submit();
                });
            });

            $('body').on("change", "input[rel=TSec]", function () {
                $("input[rel=Sec]").prop('checked', $(this).is(':checked'));
            });

            $('body').on("click", ".icon_duzenle", function () {
                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else
                    window.location.href = "poll-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&aid=" + $('input[rel=Sec]:checked:first').val();
            });

            $('.icon_anket_sonuc').click(function () {
                $("#chartAnket").empty();

                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else {
                    $.ajax({
                        type: "POST",
                        url: "<%= Request.Url.AbsolutePath %>/AnketSonuc",
                        data: '{ "AnketId":"' + $('input[rel=Sec]:checked:first').val() + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (sonuc) {
                            var oylar = $.parseJSON(sonuc.d);
                            var data;
                            var chart;
                            var soru;
                            data = new google.visualization.DataTable();
                            data.addColumn('string', 'Secenek');
                            data.addColumn('number', 'Oy');
                            $.each(oylar, function (i, anket) {
                                soru = i;
                                $.each(oylar[i], function (n, secenek) {
                                    $.each(secenek, function (key, value) {
                                        data.addRows([[key, value]]);
                                    });
                                });
                            });
                            var options = { 'title': soru, 'width': 600, 'height': 450, 'is3D': true };
                            chart = new google.visualization.PieChart(document.getElementById('chartAnket'));
                            chart.draw(data, options);

                            $("#modalAnketSonuc").modal();
                        },
                        error: function () {
                            bootbox.alert('<%= Resources.admin_language.eror_unexcepted %>');

                        }
                    });
                }
            });

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row anketler">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.poll_title %></div>
            <div class="page-head-x1"></div>





            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <a href="javascript:;" class="btn btn-info icon_duzenle"> <%= Resources.admin_language.edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"> <%= Resources.admin_language.delete %></a>
                    <a class="btn btn-warning icon_anket_sonuc"><i class="fa fa-file-text-o"></i> <%= Resources.admin_language.poll_results %></a>
                    <a href="poll-edit.aspx" class="btn btn-success icon_yeni"><%= Resources.admin_language.add_new %></a>
                </div>
            </div>


            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.poll_list %></div>
                        <div class="panel-body">

                            <asp:GridView ID="GVAnketler" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="AnketId"
                                DataSourceID="SDSAnketler" GridLines="None" AllowPaging="True"
                                OnDataBound="GVAnketler_DataBound" PageSize="20">
                                <Columns>
                                    <asp:TemplateField ShowHeader="False" ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                        <HeaderTemplate>
                                            <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <input rel="Sec" type="checkbox" value="<%# Eval("AnketId") %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Tarih" DataFormatString="{0:d}" HeaderText="<%$ Resources:admin_language,article_add_date %>" ItemStyle-CssClass="tarih" />
                                    <asp:BoundField DataField="Soru" HeaderText="<%$ Resources:admin_language,poll %>" ItemStyle-CssClass="anket" />
                                </Columns>
                                <PagerTemplate>
                                    <nav>
                                        <ul class="pagination" >
                                            <li><asp:LinkButton runat="server" ID="IlkPage" CommandName="First" aria-hidden="true" >&laquo;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="geri" CommandName="Prev"   aria-hidden="true" >&#8249;</asp:LinkButton> </li>
                                            <asp:PlaceHolder ID="Sayfalama" runat="server" />
                                            <li><asp:LinkButton runat="server" ID="ileri"  CommandName="Next" aria-hidden="true" >&#8250;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="SonPage" CommandName="Last"   aria-hidden="true" >&raquo;</asp:LinkButton></li>
                                        </ul>
                                  </nav>
                                </PagerTemplate>
                                <RowStyle CssClass="satir" />
                                <AlternatingRowStyle CssClass="aSatir" />
                                <EditRowStyle CssClass="eSatir" />
                                <SelectedRowStyle CssClass="seciliSatir" />
                                
                                <HeaderStyle CssClass="baslikSatir" />
                            </asp:GridView>

                            <div id="modalAnketSonuc" class="modal fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close icon_vazgec" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel"><%= Resources.admin_language.poll_result %></h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="chartAnket" style="width: 600px; height: 500px;">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

            </div>



        </div>
    </div>
    <input type="hidden" name="HdnSil" />
    <asp:SqlDataSource ID="SDSSonuc" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_AnketSonuc" SelectCommandType="StoredProcedure">
        <SelectParameters>

            <asp:ControlParameter ControlID="GVAnketler" Name="AnketId" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDSAnketler" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT TAA.AnketId, TAA.Tarih, TAA.Gorunurluk, TA.Soru FROM snlg_V1.TblAnketApp AS TAA LEFT OUTER JOIN snlg_V1.TblAnketDetay AS TA ON TAA.AnketId = TA.AnketId AND TA.Dil = @DefaultLang ORDER BY TA.AnketId DESC">
        <SelectParameters>
            <snlg:ApplicationParameter Name="DefaultLang" AppKeyName="DefaultLangId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
