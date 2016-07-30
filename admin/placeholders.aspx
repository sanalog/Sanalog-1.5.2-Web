<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="placeholders.aspx.cs" Inherits="admin_places" %>

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

            $('.icon_kaydet').click(function (e) {
                var hata = false;
                $('.tbl [type=text]').each(function () {
                    if (hata) {
                        e.preventDefault();
                    }
                    else if (!$(this).val()) {
                        $(this).select();
                        bootbox.alert('Girilmeyen değerler var.');
                        hata = true;
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row places">
        <div class="col-md-12">



             <div class="page-head-x4"><%= Resources.admin_language.place_holder_title %></div>
      <div class="page-head-x1"><%= Resources.admin_language.place_holder_help %></div>

                 <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
        <div class="col-md-12">
        
         
                <asp:LinkButton  runat="server" Text="<%$ Resources:admin_language, save %>"  class="btn btn-info icon_kaydet" OnClick="BtnKaydet_Click" ></asp:LinkButton>
                <a href="javascript:;" class="btn btn-danger icon_sil"> <%= Resources.admin_language.delete %></a>
                <asp:LinkButton  runat="server" title="Şablon sayfadaki yeni placeholder'ları senkronize et" Text="<%$ Resources:admin_language, senkronize %>" class="btn btn-success icon" OnClick="ImgSenkron_Click" ><i class="fa fa-refresh fa-spin"></i></asp:LinkButton>
            
            
      
     
        </div>
      </div>

  

         <div id="global_errors" class="errors-out">
            <div class="errors-in">
            </div>
        </div>
            <div class="panel">
            <div class="panel-heading"><%= Resources.admin_language.place_holder_list %></div>
            <div class="panel-body">
        <div class="tbl">

            <asp:GridView ID="GV1" runat="server" class="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="ContainerId">
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                        <ItemTemplate>
                            <input rel="Sec"  type="checkbox" value="<%# Eval("ContainerId") %>" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            <input rel="TSec" type="checkbox" title="Tümünü Seç" />
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PHName" HeaderText="<%$ Resources:admin_language, place_holder_id %>" ItemStyle-CssClass="id" />
                    <asp:TemplateField HeaderText="<%$ Resources:admin_language, place_holder_name %>" SortExpression="Title" ItemStyle-CssClass="isim">
                        <ItemTemplate>
                                <asp:TextBox ID="TB" class="form-control" runat="server" Text='<%# Bind("Title") %>' MaxLength="100"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="satir" />
                <AlternatingRowStyle CssClass="aSatir" />
                <EditRowStyle CssClass="eSatir" />
                <SelectedRowStyle CssClass="seciliSatir" />
                <PagerStyle CssClass="syfSatir" />
                <HeaderStyle CssClass="baslikSatir" />
            </asp:GridView>
        </div>
                </div>

            </div>
        </div>
    </div>
    <input type="hidden" name="HdnSil" />
</asp:Content>
