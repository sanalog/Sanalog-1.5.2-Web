<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="blocks.aspx.cs" Inherits="admin_bloklar" %>

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
                else {
                    if ($('input[rel=Sec]:checked:first').attr('data-blocktype') == "Content")
                        window.location.href = "block-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&ucid=" + $('input[rel=Sec]:checked:first').val() + "&bt=1";
                    if ($('input[rel=Sec]:checked:first').attr('data-blocktype') == "User Control")
                        window.location.href = "block-edit.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&ucid=" + $('input[rel=Sec]:checked:first').val() + "&bt=0";
                    if ($('input[rel=Sec]:checked:first').attr('data-blocktype') == "Menu")
                        window.location.href = "menu-groups.aspx?ucidd=" + $('input[rel=Sec]:checked:first').val();
                }
            });

            $('.icon_attr').click(function () {
                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else if ($('input[rel=Sec]:checked:first').attr('data-blocktype') == "Content")
                    bootbox.alert("Panelden oluşturulan içerik blokları için nitelik tanımlanamaz.");
                else
                    window.location.href = "block-attributes.aspx?ucid=" + $('input[rel=Sec]:checked:first').val();
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row bloklar">
        <div class="col-md-12">
            <div class="page-head-x4"><%= Resources.admin_language.block_title %></div>
            <div class="page-head-x1"><%= Resources.admin_language.block_help %></div>
            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <a href="javascript:;" class="btn btn-info icon_duzenle"><%= Resources.admin_language.edit %></a>
                    <a href="javascript:;" class="btn btn-info icon_attr"><i class="fa fa-cog"></i> <%= Resources.admin_language.pro_edit %></a>
                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.delete %></a>
                    <a href="block-edit.aspx" class="btn btn-success icon_yeni"><%= Resources.admin_language.article_aspx_new %></a>
                </div>
            </div>
            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.block_list %></div>
                        <div class="panel-body">
                            <asp:GridView ID="GVSyf" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="UCId"
                                DataSourceID="Sdsicerikler" GridLines="None" AllowPaging="True" AllowSorting="True"
                                PageSize="100" OnDataBound="GVSyf_DataBound">
                                <Columns>
                                    <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                        <HeaderTemplate>
                                            <input rel="TSec" type="checkbox" title="Tümünü seç" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <input rel="Sec" type="checkbox" value="<%# Eval("UCId") %>" data-blocktype="<%# Eval("BlokType") %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="<%$ Resources:admin_language,web_cont_desc_name %>" DataField="Title" ItemStyle-CssClass="tarih" />
                                    <asp:BoundField HeaderText="<%$ Resources:admin_language,heading %>" DataField="Baslik" ItemStyle-CssClass="baslik" />
                                    <asp:BoundField DataField="Aciklama" HeaderText="<%$ Resources:admin_language,description %>" ItemStyle-CssClass="aciklama" />
                                    <asp:BoundField DataField="UCPath" HeaderText="<%$ Resources:admin_language,location %>" DataFormatString="{0}.ascx" />
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="Sdsicerikler" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_UCListele" SelectCommandType="StoredProcedure">
        <SelectParameters>
        </SelectParameters>
    </asp:SqlDataSource>
    <input type="hidden" name="HdnSil" />
</asp:Content>
