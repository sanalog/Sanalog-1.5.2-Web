<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="news.aspx.cs" Inherits="admin_Haberler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
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
                    window.location.href = "news-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&hid=" + $('input[rel=Sec]:checked:first').val();
            });

        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row haberler">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.news_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.news_help %>
                
            </div>
            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">

                    <a href="javascript:;" class="btn btn-info  icon_duzenle"> <%= Resources.admin_language.edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"> <%= Resources.admin_language.delete %></a>
                    <a href="news-edit.aspx" class="btn btn-success icon_yeni"> <%= Resources.admin_language.add_new %></a>

                </div>
            </div>
            <div id="global_errors" class="errors-out">
                <div class="errors-in"></div>
            </div>


            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.news_list %></div>
                <div class="panel-body">

                    <asp:GridView ID="GVHbr" runat="server" class="table table-bordered table-striped" AutoGenerateColumns="False" DataSourceID="SDSHaberler"
                        GridLines="None" DataKeyNames="HaberId" AllowPaging="True" AllowSorting="True"
                        PageSize="30" OnDataBound="GVHbr_DataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("HaberId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Baslik" SortExpression="Baslik" HeaderText="<%$ Resources:admin_language, heading %>" ReadOnly="True"
                                ItemStyle-CssClass="baslik" HeaderStyle-CssClass="baslik" />
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
                        <SortedAscendingHeaderStyle CssClass="artan" />
                        <SortedDescendingHeaderStyle CssClass="azalan" />
                        <SortedAscendingCellStyle CssClass="artan" />
                        <SortedDescendingCellStyle CssClass="azalan" />
                    </asp:GridView>


                </div>
            </div>

        </div>
    </div>
    <input type="hidden" name="HdnSil" />
    <asp:SqlDataSource ID="SDSHaberler" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT snlg_V1.TblHaberApp.HaberId, snlg_V1.TblHaberApp.Resim, snlg_V1.TblHaberDetay.Baslik, snlg_V1.TblHaberApp.Gorunurluk FROM snlg_V1.TblHaberApp INNER JOIN snlg_V1.TblHaberDetay ON snlg_V1.TblHaberApp.HaberId = snlg_V1.TblHaberDetay.HaberId WHERE (snlg_V1.TblHaberDetay.Dil = @DefaultLang) ORDER BY snlg_V1.TblHaberApp.HaberId DESC">
        <SelectParameters>
            <snlg:ApplicationParameter Name="DefaultLang" AppKeyName="DefaultLangId" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
